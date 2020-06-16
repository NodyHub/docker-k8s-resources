#!/usr/bin/python

import sys
import signal
import os
import os.path
import requests
from http.server import HTTPServer, BaseHTTPRequestHandler
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

LISTEN = int(os.environ['LISTEN'])
TARGET = os.environ['TARGET']

VERSION = {10:"HTTP/1.0", 11:"HTTP/1.1"}

class MyRequestHandler(BaseHTTPRequestHandler):

  requested = []

  def do_GET(self):

    seen = ("GET "+self.path in self.requested)
    if not seen:
      self.requested.append("GET "+self.path)


    if not seen:
      print("/---------- Request --------------/")
      print("GET %s %s" % (self.path, self.request_version))
      print(self.headers)

    if not seen:
      print("/---------- Response -------------/")
    lookup  = os.path.dirname(os.path.realpath(__file__)) + self.path
    if os.path.isfile(lookup):
      if not seen:
        print("[+] Found '%s', reply with local file" % self.path)
      with open(lookup, 'r+') as fin:
        content = fin.readlines()
        self.send_response(200)
        self.send_header("Content-Length",sum(len(line) for line in content))
        self.end_headers()
        self.wfile.write(bytes("".join(content),"iso-8859-1"))
        if not seen:
          print("\n")
    else:
      if not seen:
        print("[+] Forward request for '%s'" % self.path)
      dst = "%s%s" % (TARGET, self.path)
      headers=dict(self.headers)
      del headers['Host']
      r = requests.get(dst, headers=headers, verify=False)
      if not seen:
        print(r.text,"\n")

      self.protocol_version=VERSION[r.raw.version]
      self.send_response(r.status_code)
      for h in r.headers:
        self.send_header(h, r.headers[h])
      self.end_headers()
      self.wfile.write(bytes(r.text,"iso-8859-1"))

  def do_POST(self):

    seen = (self.path in self.requested)
    if not seen:
      self.requested.append(self.path)


    if not seen:
      print("/---------- Request --------------/")
      print("POST %s %s" % (self.path, self.request_version))
      print(self.headers)
      content_len = int(self.headers.get('Content-Length'))
      post_body = self.rfile.read(content_len)
      print(post_body)
    else:
      content_len = int(self.headers.get('Content-Length'))
      post_body = self.rfile.read(content_len)

    if not seen:
      print("/---------- Response -------------/")
    lookup  = os.path.dirname(os.path.realpath(__file__)) + self.path
    if os.path.isfile(lookup):
      if not seen:
        print("[+] Found '%s', reply with local file" % self.path)
      with open(lookup, 'r+') as fin:
        content = fin.readlines()
        self.send_response(200)
        self.send_header("Content-Length",sum(len(line) for line in content))
        self.end_headers()
        self.wfile.write(bytes("".join(content),"iso-8859-1"))
        if not seen:
          print("\n")
    else:
      if not seen:
        print("[+] Forward request for '%s'" % self.path)
      dst = "%s%s" % (TARGET, self.path)
      headers=dict(self.headers)
      del headers['Host']
      r = requests.post(dst, headers=headers, data=post_body, verify=False)
      if not seen:
        print(r.text,"\n")

      self.protocol_version=VERSION[r.raw.version]
      self.send_response(r.status_code)
      for h in r.headers:
        self.send_header(h, r.headers[h])
      self.end_headers()
      self.wfile.write(bytes(r.text,"iso-8859-1"))

  def send_response(self, code, message=None):                                                                                                                                                                                              
    self.log_request(code)
    self.send_response_only(code, message)


def ende_im_gelaende(_signo, _stack_frame):
  print("Got signal %s, bye bye" % _signo)
  sys.exit(0)

signal.signal(signal.SIGINT, ende_im_gelaende)
signal.signal(signal.SIGTERM, ende_im_gelaende)

Handler = MyRequestHandler

with HTTPServer(("", LISTEN), Handler) as httpd:
  print("serving at port", LISTEN)
  httpd.serve_forever()






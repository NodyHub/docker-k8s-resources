#!/usr/bin/python

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

  def do_GET(self):

    print("/---------- Request --------------/")
    print("GET %s %s" % (self.path, self.request_version))
    print(self.headers)

    print("/---------- Response -------------/")
    lookup  = os.path.dirname(os.path.realpath(__file__)) + self.path
    if os.path.isfile(lookup):
      print("[+] Found '%s', reply with local file" % self.path)
      with open(lookup, 'r+') as fin:
        content = fin.readlines()
        self.send_response(200)
        self.send_header("Content-Length",sum(len(line) for line in content))
        self.end_headers()
        self.wfile.write(bytes("".join(content),"iso-8859-1"))
    else:
      print("[+] Forward request for '%s'" % self.path)
      dst = "%s%s" % (TARGET, self.path)
      headers=dict(self.headers)
      del headers['Host']
      r = requests.get(dst, headers=headers, verify=False)
      print(r.text,"\n\n")

      self.protocol_version=VERSION[r.raw.version]
      self.send_response(r.status_code)
      for h in r.headers:
        self.send_header(h, r.headers[h])
      self.end_headers()
      self.wfile.write(bytes(r.text,"iso-8859-1"))

  def send_response(self, code, message=None):                                                                                                                                                                                              
    self.log_request(code)
    self.send_response_only(code, message)




Handler = MyRequestHandler

with HTTPServer(("", LISTEN), Handler) as httpd:
  print("serving at port", LISTEN)
  httpd.serve_forever()






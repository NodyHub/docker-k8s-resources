import requests

SECRET_PATH='/var/run/secrets/kubernetes.io/serviceaccount/token'
BASE_URL='https://kubernetes/api/v1'

print('[+] Read token from %s' % SECRET_PATH)
TOKEN='fooo'
with open(SECRET_PATH) as fin:
   for line in fin:
     TOKEN=line

print('[+] Get list of endpoints from kubernetes')
headers = {"Authorization": "Bearer " + TOKEN}
endpoints=requests.get(BASE_URL, headers=headers, verify=False).json()['resources']

print('[+] Start iteration over %i endpoints' % len(endpoints))
for e in list(endpoints):
   r=requests.get(BASE_URL+'/'+e['name'], headers=headers, verify=False)
   print('[+] %i on %s' % (r.status_code, e['name']) )


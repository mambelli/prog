#snippets to read mbox mail

import mailbox
mymb=mailbox.mbox('big-20100311')


for message in mymb:
  i+=1
  print message['subject']
  print message['from']
  aa=message['subject'].find('offline')
  if aa>=0:
   print "** found %s: %s" % (aa, message['to'])
  if i>10:
   break

for m in mymb:
 if m['from'].find('arole')>=0:
   print "** Found one:"
   print m['from']
   print m['subject']
   print m['to']

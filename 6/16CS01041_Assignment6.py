import cx_Oracle
con = cx_Oracle.connect('pythonhol/welcome@127.0.0.1/orcl')
print con.version
con.close()

sql = "insert into connectedUsers values('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}',sysdate())".format(str(item['location']['lat']),str(item['location']['lng']),str(item['location']['unc']),str(item['seenTime']),str(item['ssid']),str(item['os']),str(item['clientMac']),str(item['seenEpoch']),str(item['rssi']),str(item['ipv6']),str(item['manufacturer']))
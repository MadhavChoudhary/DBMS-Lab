dns_name="latestdb.codgorspe7vk.us-east-2.rds.amazonaws.com"
port="1521"
user_name="mad"
command="$user_name@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$dns_name)(PORT=$port))(CONNECT_DATA=(SID=ORCL)))"
sqlplus $command
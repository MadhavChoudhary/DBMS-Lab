import MySQLdb as mdb
import MySQLdb.cursors

# Database Settings
DB_ONE = {  'HOST': 'localhost',
            'USER': "root",
            'PASS': "Madhav1999",
            'DB': "Assignment7"}

# General Functions

def connect_to_db(DB_SETTINGS):
    """
    Connect to a database
    Returns a connection object
    """
    DBS = DB_SETTINGS
    con = mdb.connect(user=DBS['USER'], passwd=DBS['PASS'], host=DBS['HOST'], 
                    db=DBS['DB'], cursorclass=MySQLdb.cursors.DictCursor,
                    charset = "utf8", use_unicode = True)
    return con

def run_query(query, con):
    '''
    Execute a query
    Returns a results set
    '''
    cur = con.cursor()
    cur.execute(query)
    result_set = cur.fetchall()
    return result_set

def print_result(result):
    '''
    Prints the result in human readable format
    '''
    for row in result:
        print(row)

def close(con):
    '''
    Close a db connection
    '''
    con.close()

con=connect_to_db(DB_ONE)
user=raw_input("Enter the username: ")
print (user)
query="select * from user where username="+user+";".format(user)
print (query)
result=run_query(query,con)
print_result(result)


close(con)
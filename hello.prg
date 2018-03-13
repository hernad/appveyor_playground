#require "hbpgsql"
#require "rddsql"
#require "sddpg"

#include "dbinfo.ch"
#include "error.ch"

REQUEST SDDPG
REQUEST SQLMIX

ANNOUNCE RDDSYS

PROCEDURE Main()

LOCAL oServer, pConn

? "hello world from harbour :)"

rddSetDefault( "SQLMIX" )

? "RDDs:"; AEval( rddList(), {| x | QQOut( "", x ) } )

#require "hbpgsql"

oServer := TPQServer():New( "localhost", "F18_test", "postgres", "Password12!" )

pConn := oServer:pDB
? "oServer", oServer, "pConn", pConn
// postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
IF rddInfo( 1001, { "POSTGRESQL", pConn } ) == 0
      ? "Could not connect to the server"
      RETURN
ENDIF


dbUseArea( .T., , "SELECT version() AS ver", "INFO" )
? field->ver

?
?

RETURN
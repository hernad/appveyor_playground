#require "rddsql"
#require "sddpg"

#include "dbinfo.ch"
#include "error.ch"

REQUEST SDDPG
REQUEST SQLMIX

ANNOUNCE RDDSYS

? "hello world from harbour :)"
?
?

rddSetDefault( "SQLMIX" )

? "RDDs:"; AEval( rddList(), {| x | QQOut( "", x ) } )

// postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
IF rddInfo( RDDI_CONNECT, { "POSTGRESQL", "postgresql://posgres:Password12!@localhost/F18_test" } ) == 0
      ? "Could not connect to the server"
      RETURN
ENDIF

dbUseArea( .T., , "SELECT version() AS ver", "INFO" )

? field->ver
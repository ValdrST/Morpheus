import 'package:postgres/postgres.dart';

class Conexion{
  var conn = PostgreSQLConnection("192.168.100.27", 5433, "postgres", username: "postgres", password: "nomad123");

  Conexion();
  void open(){
    conn.open();
  }

  Future<List<Map<String, Map<String, dynamic>>>> executeGetQuery(String query) async{
    
    var res;
    await conn.open();
    res = await conn.mappedResultsQuery(query);
    
    return res;
  }

  Future<int> executeQuery(String query) async{
    open();
    return conn.execute(query);
  }
}
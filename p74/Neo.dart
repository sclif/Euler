import 'package:neo4j_dart/neo4j_dart.dart';
import 'dart:async';

class Neo{
  Neo4j db;

  Neo(){
    db = new Neo4j(host: 'http://dell:7474', username: 'neo4j', password: '641436');
  }

  Future Add(Map<int, int> map) async {
    var builder = new StringBuffer();
    map.forEach((from, to) {
      return builder.write('''
MERGE (a_${from}_$to:Number {number: '$from'})
MERGE (b_${from}_$to:Number {number: '$to'})
MERGE (a_${from}_$to)-[:leads_to]->(b_${from}_$to)
      ''');
    }
    );

    await db.cypher(builder.toString());

//    print(builder.toString());
//    print('successfully created ${map.length} pairs');
  }/*

  Future<int> Count(int n) async {
    var query = '''
MATCH (n:Number) WHERE n.number = $n RETURN count(*)
    ''';
    var result = await db.cypher(query);
    var tmp = result['data'][0]['row'][0];
    print('count of nodes $n is $tmp');
    return tmp;
  }*/

  Future DeleteAll() async {
    var query = '''
MATCH (a)
OPTIONAL MATCH (a)-[r]-()
DELETE a,r
    ''';
    await db.cypher(query);

    print('graph has been cleaned up');
  }
}
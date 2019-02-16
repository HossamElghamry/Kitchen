import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('orders').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return OrderListView(documents: snapshot.data.documents);
      },
    );
  }
}

class OrderListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  OrderListView({this.documents});

  Widget _acceptButton(id) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0)),
      ),
      height: 71,
      child: FlatButton(
        splashColor: Colors.orange,
        child: Text("ACCEPT",
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: () {
          Firestore.instance
              .collection('orders')
              .document(id)
              .updateData({'accepted': true});
        },
      ),
    );
  }

  Widget _readyButton(id) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0)),
      ),
      height: 71,
      child: FlatButton(
        splashColor: Colors.orangeAccent[900],
        child: Text("READY",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () {
          Firestore.instance
              .collection('orders')
              .document(id)
              .updateData({'ready': true});
        },
      ),
    );
  }

  Widget _checkStatus(accepted, ready, id) {
    if (!accepted && !ready) {
      return _acceptButton(id);
    } else if (accepted && !ready) {
      return _readyButton(id);
    }
    return Text("ERROR");
  }

  Widget _buildOrderCard(index, client, order, accepted, ready, id) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 7),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 46.0),
              child: ListTile(
                title: Text(client,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text(order),
                trailing: _checkStatus(accepted, ready, id),
                onTap: () {
                  print(3.0);
                },
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0))),
              height: 120.0,
              width: 46,
              child: Center(
                  child: Text(
                "${1 + index}",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        String client = documents[index].data['client'];
        String order = documents[index].data['order'];
        bool accepted = documents[index].data['accepted'];
        bool ready = documents[index].data['ready'];
        String id = documents[index].documentID;
        if (!ready)
          return _buildOrderCard(index, client, order, accepted, ready, id);
      },
    );
  }
}

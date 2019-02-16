import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import './order_list.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class OrderListState {
  List<int> orders;
  OrderListState({this.orders});

  int get orderS => orders.length;

  OrderListState.initialState() : orders = [1, 2, 3];
}

class AcceptAction {
  final int index;
  AcceptAction({this.index});
}

OrderListState reducer(OrderListState prevState, action) {
  if (action is AcceptAction) {
    return OrderListState(
        orders: []
          ..addAll(prevState.orders)
          ..removeAt(action.index));
  }
  return OrderListState(orders: prevState.orders);
}

class HomeScreen extends StatelessWidget {
  final store = new Store<OrderListState>(reducer,
      initialState: OrderListState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<OrderListState>(
        store: store,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text("Cantina"),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Hossam Elghamry"),
                    accountEmail: Text("h.elghamry@nu.edu.eg"),
                  ),
                  ListTile(
                      title: Text("User Profile"),
                      trailing: Icon(Icons.account_circle),
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProfileScreen()));
                      }),
                  Divider(),
                  ListTile(
                      title: Text("Logout"),
                      trailing: Icon(Icons.exit_to_app),
                      onTap: () {}),
                ],
              ),
            ),
            body: OrderList()
            // StoreConnector(
            //     converter: (store) => store.dispatch(AcceptAction),
            //     builder: (context, viewModel) {
            //       OrderList();
            //     })),
            ));
  }
}

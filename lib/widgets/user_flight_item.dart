import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_flight_screen.dart';
import '../providers/flights.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String registration;
  final String dof;
  final String originIcao1;

  UserProductItem(this.id, this.registration, this.dof, this.originIcao1);

  String convertDate(dof) {
    var result = '';
    if (dof != '') {
      result = dof.split('-')[2] +
          '.' +
          dof.split('-')[1] +
          '.' +
          dof.split('-')[0].toString().substring(2, 4);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: ListTile(
        horizontalTitleGap: 5,
        title: Row(
          children: [
            Text(
              registration,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              originIcao1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: originIcao1.length > 15 ? 11 : 14),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            convertDate(dof),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    EditProductScreen.routeName,
                    arguments: id,
                  );
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<Flights>(context, listen: false)
                        .deleteFlight(id);
                  } catch (error) {
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text('Deleting failed!'),
                      ),
                    );
                  }
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

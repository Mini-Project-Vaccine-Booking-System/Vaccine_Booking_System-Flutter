import 'package:provider/provider.dart';
import 'package:vaccine/view_model/hospital_view_model.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

import '../view_model/account_view_model.dart';
import '../view_model/family_view_model.dart';

class Initial {
  static Future getInitialData(context) async {
    await Provider.of<AccoutnViewModel>(context, listen: false).inisialData();
    await Provider.of<FamilyViewModel>(context, listen: false).inisialData();
    await Provider.of<TicketViewModel>(context, listen: false).initialData();
  }
}

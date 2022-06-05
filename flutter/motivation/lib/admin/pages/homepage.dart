import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/admin/dataproviders/quote.dart';
import 'package:flutter_client/admin/models/quote.dart';
import 'package:flutter_client/authentication/blocs/login/login_bloc.dart';
import 'package:flutter_client/widgets/WidgetFunctions.dart';
import 'package:flutter_client/widgets/customButton.dart';
import 'package:flutter_client/widgets/customeTextField.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../blocs/quote/quote_bloc.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  var searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loggedUserEmail = "";
    var token = "";
    var state = BlocProvider.of<LoginBloc>(context).state;
    if (state is LoginSuccess) {
      loggedUserEmail = state.loggedUser.email;
      token = state.token;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<QuoteBloc, QuoteState>(
        listener: (context, state) {
          if (state is QuoteActionSucceeded) {
            showTopSnackBar(
              context,
              SizedBox(
                width: 20,
                child: CustomSnackBar.success(
                    messagePadding: const EdgeInsets.all(0),
                    icon: Container(),
                    message: state.message),
              ),
              additionalTopPadding: 0,
              displayDuration: const Duration(milliseconds: 500),
            );
            context.read<QuoteBloc>().add(
                  GetAllQuotes(token: token),
                );
          }
        },
        builder: (context, state) {
          if (state is QuoteActionInProgress) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Admin Home"),
              ),
              body: const Center(
                child: SpinKitCircle(
                  size: 50,
                  color: Colors.deepPurple,
                ),
              ),
            );
          }

          if (state is AllQuotesFetched) {
            var filterdItems = state.quotes
                .where((e) =>
                    e.author.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        ) ||
                    e.body.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        ))
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Admin Home"),
                    const SizedBox(
                      width: 5,
                    ),
                    state.quotes.isEmpty
                        ? Container()
                        : Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 150,
                              height: 38,
                              child: TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                    hintText: "Search",
                                    prefixIcon: Icon(Icons.search)),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              body: state.quotes.isEmpty
                  ? WidgetFunctions.showInfo(title: "No Quotes")
                  : filterdItems.isEmpty
                      ? WidgetFunctions.showInfo(
                          title: "No quote available for this query")
                      : Body(
                          quotes: filterdItems,
                        ),
              floatingActionButton: BlocBuilder<QuoteBloc, QuoteState>(
                builder: (context, state) {
                  if (state is AllQuotesFetched) {
                    return FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                          isDismissible: true,
                          builder: (context) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: QuoteAddAndUpdateForm(),
                          ),
                        );
                      },
                      child: const Icon(Icons.add),
                    );
                  }
                  return Container();
                },
              ),
              // bottomNavigationBar: const TabsScreen(),
              drawer: CustomDrawer(children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3B5999),
                  ),
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 130, left: 20),
                        child: Text(
                          loggedUserEmail,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 30),
                        child: const CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 26,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: 'PatrickHand',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    context.read<LoginBloc>().add(
                          Logout(),
                        );
                    GoRouter.of(context).go("/login");
                  },
                )
              ]),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Admin Home"),
            ),
            body: const Center(
              child: Text(
                "Server Error",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.quotes}) : super(key: key);
  final List<Quote> quotes;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: QuoteRow(
                value: quotes[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuoteRow extends StatelessWidget {
  const QuoteRow({
    Key? key,
    required this.value,
  }) : super(key: key);

  final Quote value;
  @override
  Widget build(BuildContext context) {
    var token = "";
    var state = BlocProvider.of<LoginBloc>(context).state;
    if (state is LoginSuccess) {
      token = state.token;
    }
    return Card(
      child: ListTile(
        trailing: SizedBox(
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      isDismissible: true,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            QuoteAddAndUpdateForm(isUpdate: true, quote: value),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.yellow.shade300,
                  ),
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () async {
                    await showConfirmDialogCustom(context,
                        title: "Do you want to delete this Quote?",
                        dialogType: DialogType.DELETE, onAccept: (context) {
                      Navigator.pop(context);
                      context.read<QuoteBloc>().add(
                            DeleteQuote(id: value.id!, token: token),
                          );
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/images.jpg"),
        ),
        title: Text(
          value.body,
          style: const TextStyle(fontFamily: "PatrickHand", fontSize: 18),
        ),
        subtitle: Text(
          value.author,
          style: TextStyle(
              fontFamily: "PatrickHand",
              fontSize: 16,
              color: Colors.grey.shade400),
        ),
      ),
    );
  }
}

class QuoteAddAndUpdateForm extends StatefulWidget {
  const QuoteAddAndUpdateForm({Key? key, this.quote, this.isUpdate = false})
      : super(key: key);
  final bool isUpdate;
  final Quote? quote;
  @override
  State<QuoteAddAndUpdateForm> createState() => _QuoteAddAndUpdateFormState();
}

class _QuoteAddAndUpdateFormState extends State<QuoteAddAndUpdateForm> {
  var categories = ["category 1", "category 2", "category 3", "category 4"];
  var selectedCategory = "category 1";
  var formKey = GlobalKey<FormState>();
  var authorController = TextEditingController();
  var bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdate) {
      authorController.text = widget.quote!.author;
      bodyController.text = widget.quote!.body;
      selectedCategory = categories[categories.indexOf(widget.quote!.category)];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("buid is called");

    var token = "";
    var state = BlocProvider.of<LoginBloc>(context).state;
    if (state is LoginSuccess) {
      token = state.token;
    }
    return BlocConsumer<QuoteBloc, QuoteState>(
      listener: (context, state) {
        if (state is QuoteActionSucceeded) {
          Navigator.pop(context);
          context.read<QuoteBloc>().add(
                GetAllQuotes(token: token),
              );
          showTopSnackBar(
            context,
            SizedBox(
              width: 20,
              child: CustomSnackBar.success(
                  messagePadding: const EdgeInsets.all(0),
                  icon: Container(),
                  message: state.message),
            ),
            additionalTopPadding: 0,
            displayDuration: const Duration(milliseconds: 500),
          );
        }
        if (state is QuoteActionFailed) {
          showTopSnackBar(
            context,
            SizedBox(
              width: 20,
              child: CustomSnackBar.error(
                  messagePadding: const EdgeInsets.all(0),
                  icon: Container(),
                  message: state.message),
            ),
            additionalTopPadding: 0,
            displayDuration: const Duration(milliseconds: 500),
          );
        }
      },
      builder: (context, state) {
        if (state is QuoteActionInProgress) {
          return const Center(
            child: SpinKitCircle(
              size: 30,
              color: Colors.deepPurple,
            ),
          );
        }
        return Form(
          key: formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isUpdate ? "Update Quote" : "Add Quote",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 47, 108, 212),
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              customTextField(
                Icons.description,
                false,
                false,
                lableText: "body",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "title is required";
                  }
                  return null;
                },
                controller: bodyController,
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                Icons.person,
                false,
                false,
                lableText: "author",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Author is required";
                  }
                  return null;
                },
                controller: authorController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Category: ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(5),
                    value: selectedCategory,
                    items: categories
                        .map(
                          (department) => DropdownMenuItem(
                            value: department,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(department),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          selectedCategory = newValue!;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                backroundcolor: Colors.grey.shade500,
                displaytext: Text(widget.isUpdate ? "Update" : "Add"),
                onPressedfun: () {
                  var state = formKey.currentState;
                  if (state!.validate()) {
                    !widget.isUpdate
                        ? context.read<QuoteBloc>().add(
                              CreateQuote(
                                token: token,
                                quote: Quote(
                                    author: authorController.text,
                                    category: selectedCategory,
                                    body: bodyController.text),
                              ),
                            )
                        : context.read<QuoteBloc>().add(
                              UpdateQuote(
                                id: widget.quote!.id!,
                                token: token,
                                quote: Quote(
                                    author: authorController.text,
                                    category: selectedCategory,
                                    body: bodyController.text),
                              ),
                            );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

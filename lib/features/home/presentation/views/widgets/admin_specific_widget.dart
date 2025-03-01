import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/core/function/custom_troast.dart';
import 'package:password_gen/core/utils/app_colors.dart';
import 'package:password_gen/core/widgets/customButton.dart';
import 'package:password_gen/features/home/presentation/home_cubit/home_cubit.dart';

class AdminSpecificWidget extends StatelessWidget {
  const AdminSpecificWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Admin Settings",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 20),
          CustomBotton(
            color: const Color.fromARGB(255, 75, 112, 108),
            text: "Manage Users",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UsersScreen(),
              ));
            },
          ),
          SizedBox(height: 10),
          CustomBotton(
            color: const Color.fromARGB(255, 75, 112, 108),
            text: "System Settings",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          " Manage Users",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..fetchUsers(),
        child: UsersList(),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is UsersFetchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UsersFetchLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              var user = state.users[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 59, 62, 87)  ,             borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  title: Text(
                    "${user['first_name']} ${user['last_name']}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email: ${user['email']}",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text("Phone: ${user['phone']}",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      // Text("Role: ${user['role']}",
                      //     style: TextStyle(
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.blue)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            backgroundColor: AppColors.bgColor,
                            title: Text("Confirm Deletion",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            content: Text(
                                "Are you sure you want to delete this user?",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Cancel",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  BlocProvider.of<HomeCubit>(context)
                                      .deleteUser(user['id'], user['email']);
                                  ShowToast('User Deleted');
                                },
                                child: Text("Delete",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        } else if (state is UsersFetchError) {
          return Center(child: Text("Something Wrong : ${state.error}"));
        }
        return Center(child: Text(" No Users Found"));
      },
    );
  }
}

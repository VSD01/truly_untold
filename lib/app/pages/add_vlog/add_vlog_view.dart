import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_pages.dart';

class AddVlog extends StatelessWidget {
  const AddVlog({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddVlogController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
              actions:  [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                   
                  
                     controller.saveBlog();
                    NavigateTo.homePageScreen();
                    },
                    child: Icon(Icons.check,color: Colors.white,))),
              ],
          ),
          
          body: AddVlogWidget(),
        );
      }
    );
  }
}


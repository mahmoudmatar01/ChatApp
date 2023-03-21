import 'package:chat_me/Controllers/ChatController.dart';
import 'package:chat_me/Widgets/My_Alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChatScreen extends StatefulWidget{
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  String?MessageText;
  TextEditingController TextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: (){
            // Get.back();
          },
          icon:const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30)),
        title: Row(
          children: [
            Container(
              height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/person.png"))
                  )
                ),
            const SizedBox(width: 10,),
            const Text("Chat",style: TextStyle(
              fontWeight:FontWeight.w800,
              color: Colors.white,
              fontSize: 20
            ),)
          ],
        ),
        actions: [
          Consumer<ChatController>(builder: (context,model,child){
                return IconButton(
                    onPressed: (){
                      model.changeTheme();
                    },
                    icon: Icon(Icons.nightlight,color:Colors.white));
              }),
          Padding(
              padding: const EdgeInsets.only(right:  8.0),
              child: Consumer<ChatController>(builder: (context,model,child){
                return IconButton(
                    onPressed: (){
                      model.SignOutMethod();
                    },
                    icon:const Icon(Icons.close,color: Colors.white));
              })
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Messages').snapshots(),
            builder: (context,snapshot){
              List MessagesList=[];
              if (snapshot.hasError) {
                MyAlert(Content: "Something went wrong").ShowAlert();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black54,
                  ),
                );
              }
              final messages=snapshot.data!.docs.reversed;
              for(var message in messages){
                final messagetext=message.get("text");
                final messagesender=message.get("Sender");
                final MessageWidget=["$messagetext","$messagesender"];
                MessagesList.add(MessageWidget);
              }
              return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                      reverse: true,
                      itemCount: MessagesList.length,
                        itemBuilder: (context,i){
                      return  Column(
                        mainAxisAlignment:
                        Provider.of<ChatController>(context).CurrentUser!.email==MessagesList[i][1]?
                        MainAxisAlignment.end:MainAxisAlignment.start,
                        crossAxisAlignment:
                        Provider.of<ChatController>(context).CurrentUser!.email==MessagesList[i][1]?
                        CrossAxisAlignment.end:CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  width:250,
                                  decoration: BoxDecoration(
                                  boxShadow: const [BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 20,
                                    blurStyle: BlurStyle.outer
                                  )],
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                  color:
                                  Provider.of<ChatController>(context).CurrentUser!.email==MessagesList[i][1]?
                                  Colors.blue:Colors.green[800],
                                  ),
                                  child: Text("${MessagesList[i][0]}",style: const TextStyle(
                                  fontSize: 15,
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold
                                  ),
                              )
                              ),
                          Text("Send by ${MessagesList[i][1]}",style:const TextStyle(
                            color: Colors.blueGrey,
                              fontStyle: FontStyle.italic
                          )),
                          const SizedBox(height: 25,)
                        ],
                      );
                    }),
                  )
              );}),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5
                  )
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: TextController,
                        onChanged: (val){
                          MessageText=val;
                        },
                    decoration: const InputDecoration(
                      hintText: "Write Message here...",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20
                      )
                    ),
                  )),
                  Consumer<ChatController>(
                      builder: (context,model,child)=>
                          TextButton(
                              onPressed: (){
                                TextController.clear();
                                  model.AddMessage(MessageText, model.CurrentUser!.email);
                              }, child:
                          const Text("Send",style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),))),

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Datapage extends StatefulWidget {
  const Datapage({super.key});

  @override
  State<Datapage> createState() => _DatapageState();
}

class _DatapageState extends State<Datapage> {
  var mybox = Hive.box("hivebox");
  List mydata = [];

  var myText = TextEditingController();
  var myValue = TextEditingController();

  void addItem(data) async {
    await mybox.add(data);
    getItem();
  }

  void getItem() {
    mydata = mybox.keys.map((e) {
      var res = mybox.get(e);
      return {
        'key': e,
        'title': res['title'],
        'value': res['value'],
        'time': res['time'],
        'isDone': res['isDone'] ?? false,
      };
    }).toList();
    mydata.sort((a, b) {
      return (a['isDone'] ? 1 : 0).compareTo(b['isDone'] ? 1 : 0);
    });
    setState(() {});
  }

  void deleteItem(int key) {
    mybox.delete(key);
    getItem();
  }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        title: Text(
          "해야 할 일 목록",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: myText,
                decoration: InputDecoration(hintText: '해야 할 일'),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: myValue,
                decoration: InputDecoration(hintText: '상세 정보'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Map<String, dynamic> d = {
                  'title': myText.text,
                  'value': myValue.text,
                  'time': DateTime.now(),
                  'isDone': false,
                };
                addItem(d);
                myText.clear();
                myValue.clear();
              },
              icon: Icon(Icons.save),
              label: Text("저장"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mydata.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: Key(mydata[index]['key'].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      deleteItem(mydata[index]['key']);
                    },
                    background: Container(
                      color: Theme.of(context).colorScheme.error,
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '삭제하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.delete, color: Colors.white),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0, right: 30),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat(
                                'yyyy.MM.dd',
                              ).format(mydata[index]['time']),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 20,)
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              mydata[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.right, // 오른쪽 정렬
                              softWrap: true, // 자동 줄바꿈 허용
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                              mydata[index]['value'],
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.right, // 오른쪽 정렬
                              softWrap: true, // 자동 줄바꿈 허용
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                        leading: GestureDetector(
                          onTap: () async {
                            final current = mydata[index];
                            final updated = {
                              'title': current['title'],
                              'value': current['value'],
                              'time': current['time'],
                              'isDone': !(current['isDone'] ?? false),
                            };
                            await mybox.put(current['key'], updated);
                            getItem();
                          },
                          child: Icon(
                            mydata[index]['isDone'] == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

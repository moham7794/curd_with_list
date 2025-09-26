import 'package:flutter/material.dart';
import '../consts/app_consts.dart';

class CRUDPage extends StatefulWidget {
  const CRUDPage({Key? key}) : super(key: key);

  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  final List<String> _items = ['عنصر 1', 'عنصر 2', 'عنصر 3'];
  final TextEditingController _textController = TextEditingController();


  void _showItemDialog({int? index}) {
    bool isEditing = index != null;
    if (isEditing) {
      _textController.text = _items[index];
    } else {
      _textController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(isEditing ? 'تعديل العنصر' : 'إضافة عنصر جديد'),
            content: TextField(
              controller: _textController,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(hintText: 'اسم العنصر'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    setState(() {
                      if (isEditing) {
                        _items[index] = _textController.text;
                      } else {
                        _items.add(_textController.text);
                      }
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text(isEditing ? 'حفظ' : 'إضافة'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة القائمة'),
        backgroundColor: AppColors.primaryBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              gradient: randomGradient(), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                _items[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () => _showItemDialog(index: index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: () => _deleteItem(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showItemDialog(),
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

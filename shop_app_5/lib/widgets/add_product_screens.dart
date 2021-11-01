import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/product_providers.dart';

class AddProductScreen extends StatefulWidget {
  // const AddProductScreen({ Key? key }) : super(key: key);

  static const routeName = '/home/add_product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  var _form = GlobalKey<FormState>();
  var isInit = true;

  void saveButton() {
    print(_titleController.text);
    print(_priceController.text);
    print(_descController.text);
    print(_imageUrlController.text);
    // if (!_form.currentState!.validate()) {
    //   return;
    // }
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      DateTime.now().toString(),
      _titleController.text,
      _descController.text,
      double.parse(_priceController.text),
      _imageUrlController.text,
    );
    setState(() {});
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    if(isInit){
      // final argsId = ModalRoute.of(context)!.settings.arguments as String;
      // print(argsId);
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: saveButton, icon: Icon(Icons.save))],
          title: Text("Add Product"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                     Scaffold.of(context).showSnackBar(SnackBar(content: Text("Harus diisi"),));
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusColor: Colors.lightBlue,
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _titleController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: _priceController,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _descController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child:
                        // ignore: unnecessary_null_comparison
                        _imageUrlController.text.isEmpty
                            ? Text(
                                "masukkan url",
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.center,
                              )
                            : Image.network(_imageUrlController.text),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Tidak boleh kosong";
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        setState(() {});
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(labelText: "Image Url"),
                      controller: _imageUrlController,
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}

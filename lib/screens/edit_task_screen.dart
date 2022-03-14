import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import '../providers/tasks.dart';

class EditTaskScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _startDateFocusNode = FocusNode();
  final _enddateFocusNode = FocusNode();
  final _receiverFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  String? _selectedEmployee;
  Task? _editedTask = Task();

  var _initValues = {
    'title': '',
    'description': '',
    'startDate': '',
    'endDate': '',
    'receiverId': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final taskId = ModalRoute.of(context)?.settings.arguments as String?;
      if (taskId != null) {
        _editedTask = Provider.of<Tasks>(context, listen: false).findById(taskId);
        _initValues = {
          'title': _editedTask?.title ?? '',
          'description': _editedTask?.description ?? '',
          'startDate': _editedTask?.startDate?.toIso8601String() ?? '',
          'endDate': _editedTask?.endDate?.toIso8601String() ?? '',
          'receiverId': _editedTask?.receiverId ?? '',
        };
        _selectedStartDate = DateTime.tryParse(_initValues['startDate'] ?? '');
        _selectedEndDate = DateTime.tryParse(_initValues['endDate'] ?? '');
        _selectedEmployee = _initValues['receiverId'];
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _startDateFocusNode.dispose();
    _enddateFocusNode.dispose();
    _receiverFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid || _selectedStartDate == null || _selectedEndDate == null || _selectedEmployee == null) {
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedTask?.id != null) {
      await Provider.of<Tasks>(context, listen: false).updateTask(_editedTask?.id ?? '', _editedTask ?? Task());
    } else {
      try {
        await Provider.of<Tasks>(context, listen: false).addTask(_editedTask ?? Task());
      } catch (e) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid Exception.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [IconButton(onPressed: _saveForm, icon: const Icon(Icons.save))],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _initValues['title'],
                        decoration: const InputDecoration(
                          labelText: 'Ttile',
                          hintText: 'Product name',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_titleFocusNode);
                        },
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedTask = Task(
                            id: _editedTask?.id,
                            title: value,
                            description: _editedTask?.description,
                            startDate: _editedTask?.startDate,
                            endDate: _editedTask?.endDate,
                            receiverId: _editedTask?.receiverId,
                          );
                        },
                      ),
                      TextFormField(
                        initialValue: _initValues['description'],
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          hintText: 'Product details',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        focusNode: _descriptionFocusNode,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter a description';
                          }
                          if ((value?.length ?? 0) < 10) {
                            return 'Should be at least 10 characters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedTask = Task(
                            id: _editedTask?.id,
                            title: _editedTask?.title,
                            description: value,
                            startDate: _editedTask?.startDate,
                            endDate: _editedTask?.endDate,
                            receiverId: _editedTask?.receiverId,
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                onChanged: (date) {}, onConfirm: (date) {
                              if (_selectedEndDate != null) {
                                if (date.isAfter(_selectedEndDate!)) {
                                  return;
                                }
                              }
                              _editedTask = Task(
                                id: _editedTask?.id,
                                title: _editedTask?.title,
                                description: _editedTask?.description,
                                startDate: date,
                                endDate: _editedTask?.endDate,
                                receiverId: _editedTask?.receiverId,
                              );
                              setState(() {
                                _selectedStartDate = date;
                              });
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Text(
                            _selectedStartDate == null
                                ? 'Choose start date time'
                                : DateFormat('yyyy-MM-dd – hh:mm a').format(_selectedStartDate!),
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                onChanged: (date) {}, onConfirm: (date) {
                              if (_selectedStartDate != null) {
                                if (date.isBefore(_selectedStartDate!)) {
                                  return;
                                }
                              }
                              _editedTask = Task(
                                id: _editedTask?.id,
                                title: _editedTask?.title,
                                description: _editedTask?.description,
                                startDate: _editedTask?.startDate,
                                endDate: date,
                                receiverId: _editedTask?.receiverId,
                              );
                              setState(() {
                                _selectedEndDate = date;
                              });
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Text(
                            _selectedEndDate == null
                                ? 'Choose end date time'
                                : DateFormat('yyyy-MM-dd – hh:mm a').format(_selectedEndDate!),
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Choose Employee',
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 300.0, // Change as per your requirement
                                          width: 300.0, // Change as per your requirement
                                          child: ListView.builder(
                                            itemCount: 10,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                title: SizedBox(
                                                  height: 50,
                                                  child: Card(
                                                    color: Colors.grey[100],
                                                    child: Center(
                                                      child: Text('Employee xxx $index'),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  // * assummned choose other employees
                                                  setState(() {
                                                    _selectedEmployee = 'John (Assume)';
                                                  });
                                                  _editedTask = Task(
                                                    id: _editedTask?.id,
                                                    title: _editedTask?.title,
                                                    description: _editedTask?.description,
                                                    startDate: _editedTask?.startDate,
                                                    endDate: _editedTask?.endDate,
                                                    receiverId: 'xxtjdxAEccYX2xzvf5KebxD9jp62',
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            _selectedEmployee == null ? 'Choose employee' : 'Employee id: ${_selectedEmployee}',
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

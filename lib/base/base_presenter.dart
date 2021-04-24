import 'package:flutter/material.dart';

abstract class BasePresenter<T> {
  T _view;
  BuildContext _context;

  T get view => _view;
  BuildContext get context => _context;

  void init(T view, BuildContext context) {
    this._view = view;
    this._context = context;
  }
}

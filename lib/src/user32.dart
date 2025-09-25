import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/src/gdi32.public.dart';
import 'user32.typedef.dart';
import 'user32.public.dart';

class User32 {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open("user32.dll");

  static final _messageBoxW =
      _lib.lookupFunction<MessageBoxWC, MessageBoxWDart>("MessageBoxW");
  static final _getAsyncKeyState =
      _lib.lookupFunction<GetAsyncKeyStateC, GetAsyncKeyStateDart>("GetAsyncKeyState");
  static final _getCursorPos =
      _lib.lookupFunction<GetCursorPosC, GetCursorPosDart>("GetCursorPos");
  static final _setCursorPos =
      _lib.lookupFunction<SetCursorPosC, SetCursorPosDart>("SetCursorPos");
  static final _showWindow =
      _lib.lookupFunction<ShowWindowC, ShowWindowDart>("ShowWindow");
  static final _getSystemMetrics =
      _lib.lookupFunction<GetSystemMetricsC, GetSystemMetricsDart>("GetSystemMetrics");

  static final _registerClassExW =
      _lib.lookupFunction<RegisterClassExWC, RegisterClassExWDart>("RegisterClassExW");
  static final _createWindowExW =
      _lib.lookupFunction<CreateWindowExWC, CreateWindowExWDart>("CreateWindowExW");
  static final _defWindowProcW =
      _lib.lookupFunction<DefWindowProcWC, DefWindowProcWDart>("DefWindowProcW");
  static final _updateWindow =
      _lib.lookupFunction<UpdateWindowC, UpdateWindowDart>("UpdateWindow");
  static final _getMessageW =
      _lib.lookupFunction<GetMessageWC, GetMessageWDart>("GetMessageW");
  static final _translateMessage =
      _lib.lookupFunction<TranslateMessageC, TranslateMessageDart>("TranslateMessage");
  static final _dispatchMessageW =
      _lib.lookupFunction<DispatchMessageWC, DispatchMessageWDart>("DispatchMessageW");
  static final _postQuitMessage =
      _lib.lookupFunction<PostQuitMessageC, PostQuitMessageDart>("PostQuitMessage");
  static final _beginPaint =
      _lib.lookupFunction<BeginPaintC, BeginPaintDart>("BeginPaint");
  static final _endPaint =
      _lib.lookupFunction<EndPaintC, EndPaintDart>("EndPaint");

  static final _setTimer =
      _lib.lookupFunction<SetTimerC, SetTimerDart>("SetTimer");
  static final _killTimer =
      _lib.lookupFunction<KillTimerC, KillTimerDart>("KillTimer");
  static final _invalidateRect =
      _lib.lookupFunction<InvalidateRectC, InvalidateRectDart>("InvalidateRect");

  static int messageBoxW(
    int hWnd,
    ffi.Pointer<Utf16> text,
    ffi.Pointer<Utf16> caption,
    int type,
  ) =>
      _messageBoxW(hWnd, text, caption, type);

  static int getAsyncKeyState(int vKey) => _getAsyncKeyState(vKey);

  static int getCursorPos(ffi.Pointer<Point> point) => _getCursorPos(point);

  static int setCursorPos(int x, int y) => _setCursorPos(x, y);

  static int showWindow(int hWnd, int nCmdShow) => _showWindow(hWnd, nCmdShow);

  static int getSystemMetrics(int index) => _getSystemMetrics(index);

  static int registerClassExW(ffi.Pointer<WNDCLASSEXW> wc) =>
      _registerClassExW(wc);

  static int createWindowExW(
    int dwExStyle,
    ffi.Pointer<Utf16> className,
    ffi.Pointer<Utf16> windowName,
    int dwStyle,
    int x,
    int y,
    int w,
    int h,
    int parent,
    int menu,
    int instance,
    ffi.Pointer<ffi.Void> param,
  ) =>
      _createWindowExW(dwExStyle, className, windowName, dwStyle, x, y, w, h,
          parent, menu, instance, param);

  static int defWindowProcW(int hWnd, int msg, int wParam, int lParam) =>
      _defWindowProcW(hWnd, msg, wParam, lParam);

  static int updateWindow(int hWnd) => _updateWindow(hWnd);

  static int getMessageW(ffi.Pointer<MSG> msg, int hWnd, int min, int max) =>
      _getMessageW(msg, hWnd, min, max);

  static int translateMessage(ffi.Pointer<MSG> msg) => _translateMessage(msg);

  static int dispatchMessageW(ffi.Pointer<MSG> msg) => _dispatchMessageW(msg);

  static void postQuitMessage(int code) => _postQuitMessage(code);

  static int beginPaint(int hWnd, ffi.Pointer<PAINTSTRUCT> ps) =>
      _beginPaint(hWnd, ps);

  static int endPaint(int hWnd, ffi.Pointer<PAINTSTRUCT> ps) =>
      _endPaint(hWnd, ps);

  static int setTimer(int hWnd, int id, int elapse, ffi.Pointer<ffi.Void> cb) =>
      _setTimer(hWnd, id, elapse, cb);

  static int killTimer(int hWnd, int id) => _killTimer(hWnd, id);

  static int invalidateRect(int hWnd, ffi.Pointer<RECT> rect, int erase) =>
      _invalidateRect(hWnd, rect, erase);
}

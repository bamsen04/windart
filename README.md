# 🪟 Windart — Windows API bindings for Dart

Windart is a **Windows API (Win32) binding library** for Dart, powered by [`dart:ffi`](https://dart.dev/guides/libraries/c-interop).  
It gives you direct access to **User32**, **Kernel32**, and **Gdi32** functions — without writing C or C++ code.

Think of it as **Dart’s gateway to the Win32 API** 🎉

---

## ✨ Features

- Full access to **common Windows APIs**:
  - `User32.dll` → windows, events, input, message boxes
  - `Kernel32.dll` → processes, files, console, environment
  - `Gdi32.dll` → drawing, bitmaps, pens, brushes, regions
- Typed **FFI structs** for RECT, MSG, PAINTSTRUCT, POINT, etc.
- Dart-friendly wrappers around C functions  
- Constants for **window messages, key codes, file access, system metrics** and more
- 100% pure Dart — no extra DLLs needed, just Windows itself

---

## 🚀 Getting Started

Add the dependency in your `pubspec.yaml`:

```
dependencies:
  windart: any
```

Then run:

```
dart pub get
```

---

## 🔧 Usage Examples

### MessageBox (User32)

```
import 'package:windart/windart.dart';
import 'package:ffi/ffi.dart';

void main() {
  User32.messageBoxW(
    0,
    "Hello from Dart!".toNativeUtf16(),
    "Windart Demo".toNativeUtf16(),
    MB_OK | MB_ICONINFORMATION,
  );
}
```

---

### Console output (Kernel32)

```
import 'package:windart/windart.dart';
import 'package:ffi/ffi.dart';
import 'dart:ffi';

void main() {
  Kernel32.allocConsole();
  final hConsole = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  final text = "Hello, Windows console 👋".toNativeUtf16();
  final written = calloc<Uint32>();

  Kernel32.writeConsoleW(hConsole, text, text.length, written, nullptr);

  calloc.free(text);
  calloc.free(written);
}
```

---

### Drawing a rectangle (Gdi32)

```
import 'package:windart/windart.dart';
import 'dart:ffi';

void main() {
  final hdc = Gdi32.getDC(0);

  final pen = Gdi32.createPen(0, 3, 0x00FF0000); // red
  final old = Gdi32.selectObject(hdc, pen);

  Gdi32.rectangle(hdc, 100, 100, 400, 300);

  Gdi32.selectObject(hdc, old);
  Gdi32.deleteObject(pen);
  Gdi32.releaseDC(0, hdc);
}
```

---

## 📖 Documentation

- [Win32 API docs (Microsoft)](https://learn.microsoft.com/en-us/windows/win32/api/)
- [dart:ffi guide](https://dart.dev/guides/libraries/c-interop)

---

## ⚡ Roadmap

- [ ] More APIs: `Advapi32`, `Shell32`, `Comctl32`  
- [ ] Higher-level Dart helpers (e.g. GUI widgets, GDI helpers)  

---

## ❤️ Contributing

Contributions are welcome!  
If you’d like to add bindings or improve wrappers, feel free to **open a PR** or file an issue.

---

## 📜 License


---

### ⚠️ Disclaimer

This package provides **low-level access** to Windows internals.  
⚡ Be careful: calling APIs with invalid arguments can crash your app.

---

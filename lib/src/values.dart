// Console handles
// ignore_for_file: constant_identifier_names

const int STD_INPUT_HANDLE  = -10;
const int STD_OUTPUT_HANDLE = -11;
const int STD_ERROR_HANDLE  = -12;

// ShowWindow commands
const int SW_HIDE            = 0;
const int SW_SHOWNORMAL      = 1;
const int SW_SHOWMINIMIZED   = 2;
const int SW_SHOWMAXIMIZED   = 3;
const int SW_SHOWNOACTIVATE  = 4;
const int SW_SHOW            = 5;
const int SW_MINIMIZE        = 6;
const int SW_SHOWMINNOACTIVE = 7;
const int SW_SHOWNA          = 8;
const int SW_RESTORE         = 9;

// MessageBox flags
const int MB_OK                = 0x00000000;
const int MB_OKCANCEL          = 0x00000001;
const int MB_ABORTRETRYIGNORE  = 0x00000002;  
const int MB_YESNOCANCEL       = 0x00000003;
const int MB_YESNO             = 0x00000004;
const int MB_RETRYCANCEL       = 0x00000005;
const int MB_ICONHAND          = 0x00000010;
const int MB_ICONQUESTION      = 0x00000020;
const int MB_ICONEXCLAMATION   = 0x00000030;
const int MB_ICONASTERISK      = 0x00000040;
const int MB_USERICON          = 0x00000080;

// System metrics indices
const int SM_CXSCREEN  = 0;
const int SM_CYSCREEN  = 1;

// File access flags
const int GENERIC_READ    = 0x80000000;
const int GENERIC_WRITE   = 0x40000000;
const int GENERIC_EXECUTE = 0x20000000;

// File creation flags
const int CREATE_NEW        = 1;
const int CREATE_ALWAYS     = 2;
const int OPEN_EXISTING     = 3;
const int OPEN_ALWAYS       = 4;
const int TRUNCATE_EXISTING = 5;

// File attributes
const int FILE_ATTRIBUTE_NORMAL = 0x80;

// Window drawing
const int WM_PAINT    = 0x000F;
const int WM_DESTROY  = 0x0002;
const int WM_CREATE   = 0x0001;
const int WM_SIZE     = 0x0005;
const int WM_CLOSE    = 0x0010;
const int WM_TIMER    = 0x0113;
const int WHITE_BRUSH = 0;

const int CW_USEDEFAULT = 0x80000000;
const int WS_OVERLAPPEDWINDOW = 0x00CF0000;

// File stuff
// Desired access
const GENERIC_ALL     = 0x10000000;

// Share mode
const FILE_SHARE_READ   = 0x00000001;
const FILE_SHARE_WRITE  = 0x00000002;
const FILE_SHARE_DELETE = 0x00000004;

// File attributes / flags
const FILE_ATTRIBUTE_READONLY  = 0x00000001;
const FILE_ATTRIBUTE_HIDDEN    = 0x00000002;
const FILE_ATTRIBUTE_SYSTEM    = 0x00000004;
const FILE_ATTRIBUTE_DIRECTORY = 0x00000010;
const FILE_ATTRIBUTE_ARCHIVE   = 0x00000020;
const FILE_ATTRIBUTE_TEMPORARY = 0x00000100;

// Special handle return
const INVALID_HANDLE_VALUE = -1;
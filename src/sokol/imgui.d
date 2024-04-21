//! Manual D Bindings (sokol-imgui.h) - need cimgui.h

module sokol.imgui;

import core.stdc.stdarg : va_list;
import sapp = sokol.app;
import sg = sokol.gfx;


version(WebAssembly){
	alias ImFileHandle = void*;
}else{
    import core.stdc.stdio: FILE;
	alias ImFileHandle = FILE*;
}

extern (C):
nothrow:
@nogc:

struct ImGuiInputTextDeactivateData;
struct ImGuiTableColumnsSettings;

alias ImGuiCol = int;
alias ImGuiCond = int;
alias ImGuiDataType = int;
alias ImGuiDir = int;
alias ImGuiMouseButton = int;
alias ImGuiMouseCursor = int;
alias ImGuiSortDirection = int;
alias ImGuiStyleVar = int;
alias ImGuiTableBgTarget = int;
alias ImDrawFlags = int;
alias ImDrawListFlags = int;
alias ImFontAtlasFlags = int;
alias ImGuiBackendFlags = int;
alias ImGuiButtonFlags = int;
alias ImGuiColorEditFlags = int;
alias ImGuiConfigFlags = int;
alias ImGuiComboFlags = int;
alias ImGuiDragDropFlags = int;
alias ImGuiFocusedFlags = int;
alias ImGuiHoveredFlags = int;
alias ImGuiInputTextFlags = int;
alias ImGuiKeyChord = int;
alias ImGuiPopupFlags = int;
alias ImGuiSelectableFlags = int;
alias ImGuiSliderFlags = int;
alias ImGuiTabBarFlags = int;
alias ImGuiTabItemFlags = int;
alias ImGuiTableFlags = int;
alias ImGuiTableColumnFlags = int;
alias ImGuiTableRowFlags = int;
alias ImGuiTreeNodeFlags = int;
alias ImGuiViewportFlags = int;
alias ImGuiWindowFlags = int;
alias ImTextureID = void*;
alias ImDrawIdx = ushort;
alias ImGuiID = uint;
alias ImS8 = byte;
alias ImU8 = ubyte;
alias ImS16 = short;
alias ImU16 = ushort;
alias ImS32 = int;
alias ImU32 = uint;
alias ImS64 = long;
alias ImU64 = ulong;
alias ImWchar16 = ushort;
alias ImWchar32 = uint;
alias ImWchar = ushort;
alias ImGuiInputTextCallback = int function(ImGuiInputTextCallbackData* data);
alias ImGuiSizeCallback = void function(ImGuiSizeCallbackData* data);
alias ImGuiMemAllocFunc = void* function(size_t sz, void* user_data);
alias ImGuiMemFreeFunc = void function(void* ptr, void* user_data);

struct ImVec2
{
    float x = 0.0f;
    float y = 0.0f;
}

struct ImVec4
{
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float w = 0.0f;
}

enum ImGuiWindowFlags_
{
    ImGuiWindowFlags_None = 0,
    ImGuiWindowFlags_NoTitleBar = 1 << 0,
    ImGuiWindowFlags_NoResize = 1 << 1,
    ImGuiWindowFlags_NoMove = 1 << 2,
    ImGuiWindowFlags_NoScrollbar = 1 << 3,
    ImGuiWindowFlags_NoScrollWithMouse = 1 << 4,
    ImGuiWindowFlags_NoCollapse = 1 << 5,
    ImGuiWindowFlags_AlwaysAutoResize = 1 << 6,
    ImGuiWindowFlags_NoBackground = 1 << 7,
    ImGuiWindowFlags_NoSavedSettings = 1 << 8,
    ImGuiWindowFlags_NoMouseInputs = 1 << 9,
    ImGuiWindowFlags_MenuBar = 1 << 10,
    ImGuiWindowFlags_HorizontalScrollbar = 1 << 11,
    ImGuiWindowFlags_NoFocusOnAppearing = 1 << 12,
    ImGuiWindowFlags_NoBringToFrontOnFocus = 1 << 13,
    ImGuiWindowFlags_AlwaysVerticalScrollbar = 1 << 14,
    ImGuiWindowFlags_AlwaysHorizontalScrollbar = 1 << 15,
    ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 16,
    ImGuiWindowFlags_NoNavInputs = 1 << 18,
    ImGuiWindowFlags_NoNavFocus = 1 << 19,
    ImGuiWindowFlags_UnsavedDocument = 1 << 20,
    ImGuiWindowFlags_NoNav = ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
    ImGuiWindowFlags_NoDecoration = ImGuiWindowFlags_NoTitleBar
        | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse,
    ImGuiWindowFlags_NoInputs = ImGuiWindowFlags_NoMouseInputs
        | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
    ImGuiWindowFlags_NavFlattened = 1 << 23,
    ImGuiWindowFlags_ChildWindow = 1 << 24,
    ImGuiWindowFlags_Tooltip = 1 << 25,
    ImGuiWindowFlags_Popup = 1 << 26,
    ImGuiWindowFlags_Modal = 1 << 27,
    ImGuiWindowFlags_ChildMenu = 1 << 28
}

enum ImGuiInputTextFlags_
{
    ImGuiInputTextFlags_None = 0,
    ImGuiInputTextFlags_CharsDecimal = 1 << 0,
    ImGuiInputTextFlags_CharsHexadecimal = 1 << 1,
    ImGuiInputTextFlags_CharsUppercase = 1 << 2,
    ImGuiInputTextFlags_CharsNoBlank = 1 << 3,
    ImGuiInputTextFlags_AutoSelectAll = 1 << 4,
    ImGuiInputTextFlags_EnterReturnsTrue = 1 << 5,
    ImGuiInputTextFlags_CallbackCompletion = 1 << 6,
    ImGuiInputTextFlags_CallbackHistory = 1 << 7,
    ImGuiInputTextFlags_CallbackAlways = 1 << 8,
    ImGuiInputTextFlags_CallbackCharFilter = 1 << 9,
    ImGuiInputTextFlags_AllowTabInput = 1 << 10,
    ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 11,
    ImGuiInputTextFlags_NoHorizontalScroll = 1 << 12,
    ImGuiInputTextFlags_AlwaysOverwrite = 1 << 13,
    ImGuiInputTextFlags_ReadOnly = 1 << 14,
    ImGuiInputTextFlags_Password = 1 << 15,
    ImGuiInputTextFlags_NoUndoRedo = 1 << 16,
    ImGuiInputTextFlags_CharsScientific = 1 << 17,
    ImGuiInputTextFlags_CallbackResize = 1 << 18,
    ImGuiInputTextFlags_CallbackEdit = 1 << 19,
    ImGuiInputTextFlags_EscapeClearsAll = 1 << 20
}

enum ImGuiTreeNodeFlags_
{
    ImGuiTreeNodeFlags_None = 0,
    ImGuiTreeNodeFlags_Selected = 1 << 0,
    ImGuiTreeNodeFlags_Framed = 1 << 1,
    ImGuiTreeNodeFlags_AllowOverlap = 1 << 2,
    ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 << 3,
    ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 << 4,
    ImGuiTreeNodeFlags_DefaultOpen = 1 << 5,
    ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 << 6,
    ImGuiTreeNodeFlags_OpenOnArrow = 1 << 7,
    ImGuiTreeNodeFlags_Leaf = 1 << 8,
    ImGuiTreeNodeFlags_Bullet = 1 << 9,
    ImGuiTreeNodeFlags_FramePadding = 1 << 10,
    ImGuiTreeNodeFlags_SpanAvailWidth = 1 << 11,
    ImGuiTreeNodeFlags_SpanFullWidth = 1 << 12,
    ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 << 13,
    ImGuiTreeNodeFlags_CollapsingHeader
        = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen
        | ImGuiTreeNodeFlags_NoAutoOpenOnLog
}

enum ImGuiPopupFlags_
{
    ImGuiPopupFlags_None = 0,
    ImGuiPopupFlags_MouseButtonLeft = 0,
    ImGuiPopupFlags_MouseButtonRight = 1,
    ImGuiPopupFlags_MouseButtonMiddle = 2,
    ImGuiPopupFlags_MouseButtonMask_ = 0x1F,
    ImGuiPopupFlags_MouseButtonDefault_ = 1,
    ImGuiPopupFlags_NoOpenOverExistingPopup = 1 << 5,
    ImGuiPopupFlags_NoOpenOverItems = 1 << 6,
    ImGuiPopupFlags_AnyPopupId = 1 << 7,
    ImGuiPopupFlags_AnyPopupLevel = 1 << 8,
    ImGuiPopupFlags_AnyPopup = ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel
}

enum ImGuiSelectableFlags_
{
    ImGuiSelectableFlags_None = 0,
    ImGuiSelectableFlags_DontClosePopups = 1 << 0,
    ImGuiSelectableFlags_SpanAllColumns = 1 << 1,
    ImGuiSelectableFlags_AllowDoubleClick = 1 << 2,
    ImGuiSelectableFlags_Disabled = 1 << 3,
    ImGuiSelectableFlags_AllowOverlap = 1 << 4
}

enum ImGuiComboFlags_
{
    ImGuiComboFlags_None = 0,
    ImGuiComboFlags_PopupAlignLeft = 1 << 0,
    ImGuiComboFlags_HeightSmall = 1 << 1,
    ImGuiComboFlags_HeightRegular = 1 << 2,
    ImGuiComboFlags_HeightLarge = 1 << 3,
    ImGuiComboFlags_HeightLargest = 1 << 4,
    ImGuiComboFlags_NoArrowButton = 1 << 5,
    ImGuiComboFlags_NoPreview = 1 << 6,
    ImGuiComboFlags_HeightMask_ = ImGuiComboFlags_HeightSmall
        | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge
        | ImGuiComboFlags_HeightLargest
}

enum ImGuiTabBarFlags_
{
    ImGuiTabBarFlags_None = 0,
    ImGuiTabBarFlags_Reorderable = 1 << 0,
    ImGuiTabBarFlags_AutoSelectNewTabs = 1 << 1,
    ImGuiTabBarFlags_TabListPopupButton = 1 << 2,
    ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 << 3,
    ImGuiTabBarFlags_NoTabListScrollingButtons = 1 << 4,
    ImGuiTabBarFlags_NoTooltip = 1 << 5,
    ImGuiTabBarFlags_FittingPolicyResizeDown = 1 << 6,
    ImGuiTabBarFlags_FittingPolicyScroll = 1 << 7,
    ImGuiTabBarFlags_FittingPolicyMask_ = ImGuiTabBarFlags_FittingPolicyResizeDown
        | ImGuiTabBarFlags_FittingPolicyScroll,
    ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown
}

enum ImGuiTabItemFlags_
{
    ImGuiTabItemFlags_None = 0,
    ImGuiTabItemFlags_UnsavedDocument = 1 << 0,
    ImGuiTabItemFlags_SetSelected = 1 << 1,
    ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 << 2,
    ImGuiTabItemFlags_NoPushId = 1 << 3,
    ImGuiTabItemFlags_NoTooltip = 1 << 4,
    ImGuiTabItemFlags_NoReorder = 1 << 5,
    ImGuiTabItemFlags_Leading = 1 << 6,
    ImGuiTabItemFlags_Trailing = 1 << 7
}

enum ImGuiTableFlags_
{
    ImGuiTableFlags_None = 0,
    ImGuiTableFlags_Resizable = 1 << 0,
    ImGuiTableFlags_Reorderable = 1 << 1,
    ImGuiTableFlags_Hideable = 1 << 2,
    ImGuiTableFlags_Sortable = 1 << 3,
    ImGuiTableFlags_NoSavedSettings = 1 << 4,
    ImGuiTableFlags_ContextMenuInBody = 1 << 5,
    ImGuiTableFlags_RowBg = 1 << 6,
    ImGuiTableFlags_BordersInnerH = 1 << 7,
    ImGuiTableFlags_BordersOuterH = 1 << 8,
    ImGuiTableFlags_BordersInnerV = 1 << 9,
    ImGuiTableFlags_BordersOuterV = 1 << 10,
    ImGuiTableFlags_BordersH = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_BordersV = ImGuiTableFlags_BordersInnerV
        | ImGuiTableFlags_BordersOuterV, ImGuiTableFlags_BordersInner
        = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH,
    ImGuiTableFlags_BordersOuter = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_Borders = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter,
    ImGuiTableFlags_NoBordersInBody = 1 << 11,
    ImGuiTableFlags_NoBordersInBodyUntilResize = 1 << 12,
    ImGuiTableFlags_SizingFixedFit = 1 << 13,
    ImGuiTableFlags_SizingFixedSame = 2 << 13,
    ImGuiTableFlags_SizingStretchProp = 3 << 13,
    ImGuiTableFlags_SizingStretchSame = 4 << 13,
    ImGuiTableFlags_NoHostExtendX = 1 << 16,
    ImGuiTableFlags_NoHostExtendY = 1 << 17,
    ImGuiTableFlags_NoKeepColumnsVisible = 1 << 18,
    ImGuiTableFlags_PreciseWidths = 1 << 19,
    ImGuiTableFlags_NoClip = 1 << 20,
    ImGuiTableFlags_PadOuterX = 1 << 21,
    ImGuiTableFlags_NoPadOuterX = 1 << 22,
    ImGuiTableFlags_NoPadInnerX = 1 << 23,
    ImGuiTableFlags_ScrollX = 1 << 24,
    ImGuiTableFlags_ScrollY = 1 << 25,
    ImGuiTableFlags_SortMulti = 1 << 26,
    ImGuiTableFlags_SortTristate = 1 << 27,
    ImGuiTableFlags_SizingMask_ = ImGuiTableFlags_SizingFixedFit
        | ImGuiTableFlags_SizingFixedSame | ImGuiTableFlags_SizingStretchProp
        | ImGuiTableFlags_SizingStretchSame
}

enum ImGuiTableColumnFlags_
{
    ImGuiTableColumnFlags_None = 0,
    ImGuiTableColumnFlags_Disabled = 1 << 0,
    ImGuiTableColumnFlags_DefaultHide = 1 << 1,
    ImGuiTableColumnFlags_DefaultSort = 1 << 2,
    ImGuiTableColumnFlags_WidthStretch = 1 << 3,
    ImGuiTableColumnFlags_WidthFixed = 1 << 4,
    ImGuiTableColumnFlags_NoResize = 1 << 5,
    ImGuiTableColumnFlags_NoReorder = 1 << 6,
    ImGuiTableColumnFlags_NoHide = 1 << 7,
    ImGuiTableColumnFlags_NoClip = 1 << 8,
    ImGuiTableColumnFlags_NoSort = 1 << 9,
    ImGuiTableColumnFlags_NoSortAscending = 1 << 10,
    ImGuiTableColumnFlags_NoSortDescending = 1 << 11,
    ImGuiTableColumnFlags_NoHeaderLabel = 1 << 12,
    ImGuiTableColumnFlags_NoHeaderWidth = 1 << 13,
    ImGuiTableColumnFlags_PreferSortAscending = 1 << 14,
    ImGuiTableColumnFlags_PreferSortDescending = 1 << 15,
    ImGuiTableColumnFlags_IndentEnable = 1 << 16,
    ImGuiTableColumnFlags_IndentDisable = 1 << 17,
    ImGuiTableColumnFlags_IsEnabled = 1 << 24,
    ImGuiTableColumnFlags_IsVisible = 1 << 25,
    ImGuiTableColumnFlags_IsSorted = 1 << 26,
    ImGuiTableColumnFlags_IsHovered = 1 << 27,
    ImGuiTableColumnFlags_WidthMask_
        = ImGuiTableColumnFlags_WidthStretch | ImGuiTableColumnFlags_WidthFixed,
    ImGuiTableColumnFlags_IndentMask_ = ImGuiTableColumnFlags_IndentEnable | ImGuiTableColumnFlags_IndentDisable,
    ImGuiTableColumnFlags_StatusMask_ = ImGuiTableColumnFlags_IsEnabled
        | ImGuiTableColumnFlags_IsVisible | ImGuiTableColumnFlags_IsSorted
        | ImGuiTableColumnFlags_IsHovered, ImGuiTableColumnFlags_NoDirectResize_ = 1 << 30
}

enum ImGuiTableRowFlags_
{
    ImGuiTableRowFlags_None = 0,
    ImGuiTableRowFlags_Headers = 1 << 0
}

enum ImGuiTableBgTarget_
{
    ImGuiTableBgTarget_None = 0,
    ImGuiTableBgTarget_RowBg0 = 1,
    ImGuiTableBgTarget_RowBg1 = 2,
    ImGuiTableBgTarget_CellBg = 3
}

enum ImGuiFocusedFlags_
{
    ImGuiFocusedFlags_None = 0,
    ImGuiFocusedFlags_ChildWindows = 1 << 0,
    ImGuiFocusedFlags_RootWindow = 1 << 1,
    ImGuiFocusedFlags_AnyWindow = 1 << 2,
    ImGuiFocusedFlags_NoPopupHierarchy = 1 << 3,
    ImGuiFocusedFlags_RootAndChildWindows = ImGuiFocusedFlags_RootWindow
        | ImGuiFocusedFlags_ChildWindows
}

enum ImGuiHoveredFlags_
{
    ImGuiHoveredFlags_None = 0,
    ImGuiHoveredFlags_ChildWindows = 1 << 0,
    ImGuiHoveredFlags_RootWindow = 1 << 1,
    ImGuiHoveredFlags_AnyWindow = 1 << 2,
    ImGuiHoveredFlags_NoPopupHierarchy = 1 << 3,
    ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 << 5,
    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 << 7,
    ImGuiHoveredFlags_AllowWhenOverlappedByItem = 1 << 8,
    ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 1 << 9,
    ImGuiHoveredFlags_AllowWhenDisabled = 1 << 10,
    ImGuiHoveredFlags_NoNavOverride = 1 << 11,
    ImGuiHoveredFlags_AllowWhenOverlapped
        = ImGuiHoveredFlags_AllowWhenOverlappedByItem | ImGuiHoveredFlags_AllowWhenOverlappedByWindow,
    ImGuiHoveredFlags_RectOnly = ImGuiHoveredFlags_AllowWhenBlockedByPopup
        | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped,
    ImGuiHoveredFlags_RootAndChildWindows = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows,
    ImGuiHoveredFlags_ForTooltip = 1 << 12,
    ImGuiHoveredFlags_Stationary = 1 << 13,
    ImGuiHoveredFlags_DelayNone = 1 << 14,
    ImGuiHoveredFlags_DelayShort = 1 << 15,
    ImGuiHoveredFlags_DelayNormal = 1 << 16,
    ImGuiHoveredFlags_NoSharedDelay = 1 << 17
}

enum ImGuiDragDropFlags_
{
    ImGuiDragDropFlags_None = 0,
    ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 << 0,
    ImGuiDragDropFlags_SourceNoDisableHover = 1 << 1,
    ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 << 2,
    ImGuiDragDropFlags_SourceAllowNullID = 1 << 3,
    ImGuiDragDropFlags_SourceExtern = 1 << 4,
    ImGuiDragDropFlags_SourceAutoExpirePayload = 1 << 5,
    ImGuiDragDropFlags_AcceptBeforeDelivery = 1 << 10,
    ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 << 11,
    ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 << 12,
    ImGuiDragDropFlags_AcceptPeekOnly = ImGuiDragDropFlags_AcceptBeforeDelivery
        | ImGuiDragDropFlags_AcceptNoDrawDefaultRect
}

enum ImGuiDataType_
{
    ImGuiDataType_S8 = 0,
    ImGuiDataType_U8 = 1,
    ImGuiDataType_S16 = 2,
    ImGuiDataType_U16 = 3,
    ImGuiDataType_S32 = 4,
    ImGuiDataType_U32 = 5,
    ImGuiDataType_S64 = 6,
    ImGuiDataType_U64 = 7,
    ImGuiDataType_Float = 8,
    ImGuiDataType_Double = 9,
    ImGuiDataType_COUNT = 10
}

enum ImGuiDir_
{
    ImGuiDir_None = -1,
    ImGuiDir_Left = 0,
    ImGuiDir_Right = 1,
    ImGuiDir_Up = 2,
    ImGuiDir_Down = 3,
    ImGuiDir_COUNT = 4
}

enum ImGuiSortDirection_
{
    ImGuiSortDirection_None = 0,
    ImGuiSortDirection_Ascending = 1,
    ImGuiSortDirection_Descending = 2
}

enum ImGuiKey
{
    ImGuiKey_None = 0,
    ImGuiKey_Tab = 512,
    ImGuiKey_LeftArrow = 513,
    ImGuiKey_RightArrow = 514,
    ImGuiKey_UpArrow = 515,
    ImGuiKey_DownArrow = 516,
    ImGuiKey_PageUp = 517,
    ImGuiKey_PageDown = 518,
    ImGuiKey_Home = 519,
    ImGuiKey_End = 520,
    ImGuiKey_Insert = 521,
    ImGuiKey_Delete = 522,
    ImGuiKey_Backspace = 523,
    ImGuiKey_Space = 524,
    ImGuiKey_Enter = 525,
    ImGuiKey_Escape = 526,
    ImGuiKey_LeftCtrl = 527,
    ImGuiKey_LeftShift = 528,
    ImGuiKey_LeftAlt = 529,
    ImGuiKey_LeftSuper = 530,
    ImGuiKey_RightCtrl = 531,
    ImGuiKey_RightShift = 532,
    ImGuiKey_RightAlt = 533,
    ImGuiKey_RightSuper = 534,
    ImGuiKey_Menu = 535,
    ImGuiKey_0 = 536,
    ImGuiKey_1 = 537,
    ImGuiKey_2 = 538,
    ImGuiKey_3 = 539,
    ImGuiKey_4 = 540,
    ImGuiKey_5 = 541,
    ImGuiKey_6 = 542,
    ImGuiKey_7 = 543,
    ImGuiKey_8 = 544,
    ImGuiKey_9 = 545,
    ImGuiKey_A = 546,
    ImGuiKey_B = 547,
    ImGuiKey_C = 548,
    ImGuiKey_D = 549,
    ImGuiKey_E = 550,
    ImGuiKey_F = 551,
    ImGuiKey_G = 552,
    ImGuiKey_H = 553,
    ImGuiKey_I = 554,
    ImGuiKey_J = 555,
    ImGuiKey_K = 556,
    ImGuiKey_L = 557,
    ImGuiKey_M = 558,
    ImGuiKey_N = 559,
    ImGuiKey_O = 560,
    ImGuiKey_P = 561,
    ImGuiKey_Q = 562,
    ImGuiKey_R = 563,
    ImGuiKey_S = 564,
    ImGuiKey_T = 565,
    ImGuiKey_U = 566,
    ImGuiKey_V = 567,
    ImGuiKey_W = 568,
    ImGuiKey_X = 569,
    ImGuiKey_Y = 570,
    ImGuiKey_Z = 571,
    ImGuiKey_F1 = 572,
    ImGuiKey_F2 = 573,
    ImGuiKey_F3 = 574,
    ImGuiKey_F4 = 575,
    ImGuiKey_F5 = 576,
    ImGuiKey_F6 = 577,
    ImGuiKey_F7 = 578,
    ImGuiKey_F8 = 579,
    ImGuiKey_F9 = 580,
    ImGuiKey_F10 = 581,
    ImGuiKey_F11 = 582,
    ImGuiKey_F12 = 583,
    ImGuiKey_Apostrophe = 584,
    ImGuiKey_Comma = 585,
    ImGuiKey_Minus = 586,
    ImGuiKey_Period = 587,
    ImGuiKey_Slash = 588,
    ImGuiKey_Semicolon = 589,
    ImGuiKey_Equal = 590,
    ImGuiKey_LeftBracket = 591,
    ImGuiKey_Backslash = 592,
    ImGuiKey_RightBracket = 593,
    ImGuiKey_GraveAccent = 594,
    ImGuiKey_CapsLock = 595,
    ImGuiKey_ScrollLock = 596,
    ImGuiKey_NumLock = 597,
    ImGuiKey_PrintScreen = 598,
    ImGuiKey_Pause = 599,
    ImGuiKey_Keypad0 = 600,
    ImGuiKey_Keypad1 = 601,
    ImGuiKey_Keypad2 = 602,
    ImGuiKey_Keypad3 = 603,
    ImGuiKey_Keypad4 = 604,
    ImGuiKey_Keypad5 = 605,
    ImGuiKey_Keypad6 = 606,
    ImGuiKey_Keypad7 = 607,
    ImGuiKey_Keypad8 = 608,
    ImGuiKey_Keypad9 = 609,
    ImGuiKey_KeypadDecimal = 610,
    ImGuiKey_KeypadDivide = 611,
    ImGuiKey_KeypadMultiply = 612,
    ImGuiKey_KeypadSubtract = 613,
    ImGuiKey_KeypadAdd = 614,
    ImGuiKey_KeypadEnter = 615,
    ImGuiKey_KeypadEqual = 616,
    ImGuiKey_GamepadStart = 617,
    ImGuiKey_GamepadBack = 618,
    ImGuiKey_GamepadFaceLeft = 619,
    ImGuiKey_GamepadFaceRight = 620,
    ImGuiKey_GamepadFaceUp = 621,
    ImGuiKey_GamepadFaceDown = 622,
    ImGuiKey_GamepadDpadLeft = 623,
    ImGuiKey_GamepadDpadRight = 624,
    ImGuiKey_GamepadDpadUp = 625,
    ImGuiKey_GamepadDpadDown = 626,
    ImGuiKey_GamepadL1 = 627,
    ImGuiKey_GamepadR1 = 628,
    ImGuiKey_GamepadL2 = 629,
    ImGuiKey_GamepadR2 = 630,
    ImGuiKey_GamepadL3 = 631,
    ImGuiKey_GamepadR3 = 632,
    ImGuiKey_GamepadLStickLeft = 633,
    ImGuiKey_GamepadLStickRight = 634,
    ImGuiKey_GamepadLStickUp = 635,
    ImGuiKey_GamepadLStickDown = 636,
    ImGuiKey_GamepadRStickLeft = 637,
    ImGuiKey_GamepadRStickRight = 638,
    ImGuiKey_GamepadRStickUp = 639,
    ImGuiKey_GamepadRStickDown = 640,
    ImGuiKey_MouseLeft = 641,
    ImGuiKey_MouseRight = 642,
    ImGuiKey_MouseMiddle = 643,
    ImGuiKey_MouseX1 = 644,
    ImGuiKey_MouseX2 = 645,
    ImGuiKey_MouseWheelX = 646,
    ImGuiKey_MouseWheelY = 647,
    ImGuiKey_ReservedForModCtrl = 648,
    ImGuiKey_ReservedForModShift = 649,
    ImGuiKey_ReservedForModAlt = 650,
    ImGuiKey_ReservedForModSuper = 651,
    ImGuiKey_COUNT = 652,
    ImGuiMod_None = 0,
    ImGuiMod_Ctrl = 1 << 12,
    ImGuiMod_Shift = 1 << 13,
    ImGuiMod_Alt = 1 << 14,
    ImGuiMod_Super = 1 << 15,
    ImGuiMod_Shortcut = 1 << 11,
    ImGuiMod_Mask_ = 0xF800,
    ImGuiKey_NamedKey_BEGIN = 512,
    ImGuiKey_NamedKey_END = ImGuiKey_COUNT,
    ImGuiKey_NamedKey_COUNT = ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN,
    ImGuiKey_KeysData_SIZE = ImGuiKey_COUNT,
    ImGuiKey_KeysData_OFFSET = 0
}

enum ImGuiNavInput
{
    ImGuiNavInput_Activate = 0,
    ImGuiNavInput_Cancel = 1,
    ImGuiNavInput_Input = 2,
    ImGuiNavInput_Menu = 3,
    ImGuiNavInput_DpadLeft = 4,
    ImGuiNavInput_DpadRight = 5,
    ImGuiNavInput_DpadUp = 6,
    ImGuiNavInput_DpadDown = 7,
    ImGuiNavInput_LStickLeft = 8,
    ImGuiNavInput_LStickRight = 9,
    ImGuiNavInput_LStickUp = 10,
    ImGuiNavInput_LStickDown = 11,
    ImGuiNavInput_FocusPrev = 12,
    ImGuiNavInput_FocusNext = 13,
    ImGuiNavInput_TweakSlow = 14,
    ImGuiNavInput_TweakFast = 15,
    ImGuiNavInput_COUNT = 16
}

enum ImGuiConfigFlags_
{
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1 << 0,
    ImGuiConfigFlags_NavEnableGamepad = 1 << 1,
    ImGuiConfigFlags_NavEnableSetMousePos = 1 << 2,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 1 << 3,
    ImGuiConfigFlags_NoMouse = 1 << 4,
    ImGuiConfigFlags_NoMouseCursorChange = 1 << 5,
    ImGuiConfigFlags_IsSRGB = 1 << 20,
    ImGuiConfigFlags_IsTouchScreen = 1 << 21
}

enum ImGuiBackendFlags_
{
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1 << 0,
    ImGuiBackendFlags_HasMouseCursors = 1 << 1,
    ImGuiBackendFlags_HasSetMousePos = 1 << 2,
    ImGuiBackendFlags_RendererHasVtxOffset = 1 << 3
}

enum ImGuiCol_
{
    ImGuiCol_Text = 0,
    ImGuiCol_TextDisabled = 1,
    ImGuiCol_WindowBg = 2,
    ImGuiCol_ChildBg = 3,
    ImGuiCol_PopupBg = 4,
    ImGuiCol_Border = 5,
    ImGuiCol_BorderShadow = 6,
    ImGuiCol_FrameBg = 7,
    ImGuiCol_FrameBgHovered = 8,
    ImGuiCol_FrameBgActive = 9,
    ImGuiCol_TitleBg = 10,
    ImGuiCol_TitleBgActive = 11,
    ImGuiCol_TitleBgCollapsed = 12,
    ImGuiCol_MenuBarBg = 13,
    ImGuiCol_ScrollbarBg = 14,
    ImGuiCol_ScrollbarGrab = 15,
    ImGuiCol_ScrollbarGrabHovered = 16,
    ImGuiCol_ScrollbarGrabActive = 17,
    ImGuiCol_CheckMark = 18,
    ImGuiCol_SliderGrab = 19,
    ImGuiCol_SliderGrabActive = 20,
    ImGuiCol_Button = 21,
    ImGuiCol_ButtonHovered = 22,
    ImGuiCol_ButtonActive = 23,
    ImGuiCol_Header = 24,
    ImGuiCol_HeaderHovered = 25,
    ImGuiCol_HeaderActive = 26,
    ImGuiCol_Separator = 27,
    ImGuiCol_SeparatorHovered = 28,
    ImGuiCol_SeparatorActive = 29,
    ImGuiCol_ResizeGrip = 30,
    ImGuiCol_ResizeGripHovered = 31,
    ImGuiCol_ResizeGripActive = 32,
    ImGuiCol_Tab = 33,
    ImGuiCol_TabHovered = 34,
    ImGuiCol_TabActive = 35,
    ImGuiCol_TabUnfocused = 36,
    ImGuiCol_TabUnfocusedActive = 37,
    ImGuiCol_PlotLines = 38,
    ImGuiCol_PlotLinesHovered = 39,
    ImGuiCol_PlotHistogram = 40,
    ImGuiCol_PlotHistogramHovered = 41,
    ImGuiCol_TableHeaderBg = 42,
    ImGuiCol_TableBorderStrong = 43,
    ImGuiCol_TableBorderLight = 44,
    ImGuiCol_TableRowBg = 45,
    ImGuiCol_TableRowBgAlt = 46,
    ImGuiCol_TextSelectedBg = 47,
    ImGuiCol_DragDropTarget = 48,
    ImGuiCol_NavHighlight = 49,
    ImGuiCol_NavWindowingHighlight = 50,
    ImGuiCol_NavWindowingDimBg = 51,
    ImGuiCol_ModalWindowDimBg = 52,
    ImGuiCol_COUNT = 53
}

enum ImGuiStyleVar_
{
    ImGuiStyleVar_Alpha = 0,
    ImGuiStyleVar_DisabledAlpha = 1,
    ImGuiStyleVar_WindowPadding = 2,
    ImGuiStyleVar_WindowRounding = 3,
    ImGuiStyleVar_WindowBorderSize = 4,
    ImGuiStyleVar_WindowMinSize = 5,
    ImGuiStyleVar_WindowTitleAlign = 6,
    ImGuiStyleVar_ChildRounding = 7,
    ImGuiStyleVar_ChildBorderSize = 8,
    ImGuiStyleVar_PopupRounding = 9,
    ImGuiStyleVar_PopupBorderSize = 10,
    ImGuiStyleVar_FramePadding = 11,
    ImGuiStyleVar_FrameRounding = 12,
    ImGuiStyleVar_FrameBorderSize = 13,
    ImGuiStyleVar_ItemSpacing = 14,
    ImGuiStyleVar_ItemInnerSpacing = 15,
    ImGuiStyleVar_IndentSpacing = 16,
    ImGuiStyleVar_CellPadding = 17,
    ImGuiStyleVar_ScrollbarSize = 18,
    ImGuiStyleVar_ScrollbarRounding = 19,
    ImGuiStyleVar_GrabMinSize = 20,
    ImGuiStyleVar_GrabRounding = 21,
    ImGuiStyleVar_TabRounding = 22,
    ImGuiStyleVar_ButtonTextAlign = 23,
    ImGuiStyleVar_SelectableTextAlign = 24,
    ImGuiStyleVar_SeparatorTextBorderSize = 25,
    ImGuiStyleVar_SeparatorTextAlign = 26,
    ImGuiStyleVar_SeparatorTextPadding = 27,
    ImGuiStyleVar_COUNT = 28
}

enum ImGuiButtonFlags_
{
    ImGuiButtonFlags_None = 0,
    ImGuiButtonFlags_MouseButtonLeft = 1 << 0,
    ImGuiButtonFlags_MouseButtonRight = 1 << 1,
    ImGuiButtonFlags_MouseButtonMiddle = 1 << 2,
    ImGuiButtonFlags_MouseButtonMask_ = ImGuiButtonFlags_MouseButtonLeft
        | ImGuiButtonFlags_MouseButtonRight | ImGuiButtonFlags_MouseButtonMiddle,
    ImGuiButtonFlags_MouseButtonDefault_ = ImGuiButtonFlags_MouseButtonLeft
}

enum ImGuiColorEditFlags_
{
    ImGuiColorEditFlags_None = 0,
    ImGuiColorEditFlags_NoAlpha = 1 << 1,
    ImGuiColorEditFlags_NoPicker = 1 << 2,
    ImGuiColorEditFlags_NoOptions = 1 << 3,
    ImGuiColorEditFlags_NoSmallPreview = 1 << 4,
    ImGuiColorEditFlags_NoInputs = 1 << 5,
    ImGuiColorEditFlags_NoTooltip = 1 << 6,
    ImGuiColorEditFlags_NoLabel = 1 << 7,
    ImGuiColorEditFlags_NoSidePreview = 1 << 8,
    ImGuiColorEditFlags_NoDragDrop = 1 << 9,
    ImGuiColorEditFlags_NoBorder = 1 << 10,
    ImGuiColorEditFlags_AlphaBar = 1 << 16,
    ImGuiColorEditFlags_AlphaPreview = 1 << 17,
    ImGuiColorEditFlags_AlphaPreviewHalf = 1 << 18,
    ImGuiColorEditFlags_HDR = 1 << 19,
    ImGuiColorEditFlags_DisplayRGB = 1 << 20,
    ImGuiColorEditFlags_DisplayHSV = 1 << 21,
    ImGuiColorEditFlags_DisplayHex = 1 << 22,
    ImGuiColorEditFlags_Uint8 = 1 << 23,
    ImGuiColorEditFlags_Float = 1 << 24,
    ImGuiColorEditFlags_PickerHueBar = 1 << 25,
    ImGuiColorEditFlags_PickerHueWheel = 1 << 26,
    ImGuiColorEditFlags_InputRGB = 1 << 27,
    ImGuiColorEditFlags_InputHSV = 1 << 28,
    ImGuiColorEditFlags_DefaultOptions_
        = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB
        | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags_DisplayMask_ = ImGuiColorEditFlags_DisplayRGB
        | ImGuiColorEditFlags_DisplayHSV | ImGuiColorEditFlags_DisplayHex,
    ImGuiColorEditFlags_DataTypeMask_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_Float,
    ImGuiColorEditFlags_PickerMask_
        = ImGuiColorEditFlags_PickerHueWheel | ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags_InputMask_ = ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_InputHSV
}

enum ImGuiSliderFlags_
{
    ImGuiSliderFlags_None = 0,
    ImGuiSliderFlags_AlwaysClamp = 1 << 4,
    ImGuiSliderFlags_Logarithmic = 1 << 5,
    ImGuiSliderFlags_NoRoundToFormat = 1 << 6,
    ImGuiSliderFlags_NoInput = 1 << 7,
    ImGuiSliderFlags_InvalidMask_ = 0x7000000F
}

enum ImGuiMouseButton_
{
    ImGuiMouseButton_Left = 0,
    ImGuiMouseButton_Right = 1,
    ImGuiMouseButton_Middle = 2,
    ImGuiMouseButton_COUNT = 5
}

enum ImGuiMouseCursor_
{
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput = 1,
    ImGuiMouseCursor_ResizeAll = 2,
    ImGuiMouseCursor_ResizeNS = 3,
    ImGuiMouseCursor_ResizeEW = 4,
    ImGuiMouseCursor_ResizeNESW = 5,
    ImGuiMouseCursor_ResizeNWSE = 6,
    ImGuiMouseCursor_Hand = 7,
    ImGuiMouseCursor_NotAllowed = 8,
    ImGuiMouseCursor_COUNT = 9
}

enum ImGuiMouseSource
{
    ImGuiMouseSource_Mouse = 0,
    ImGuiMouseSource_TouchScreen = 1,
    ImGuiMouseSource_Pen = 2,
    ImGuiMouseSource_COUNT = 3
}

enum ImGuiCond_
{
    ImGuiCond_None = 0,
    ImGuiCond_Always = 1 << 0,
    ImGuiCond_Once = 1 << 1,
    ImGuiCond_FirstUseEver = 1 << 2,
    ImGuiCond_Appearing = 1 << 3
}

struct ImGuiStyle
{
    float Alpha = 0.0f;
    float DisabledAlpha = 0.0f;
    ImVec2 WindowPadding;
    float WindowRounding = 0.0f;
    float WindowBorderSize = 0.0f;
    ImVec2 WindowMinSize;
    ImVec2 WindowTitleAlign;
    ImGuiDir WindowMenuButtonPosition;
    float ChildRounding = 0.0f;
    float ChildBorderSize = 0.0f;
    float PopupRounding = 0.0f;
    float PopupBorderSize = 0.0f;
    ImVec2 FramePadding;
    float FrameRounding = 0.0f;
    float FrameBorderSize = 0.0f;
    ImVec2 ItemSpacing;
    ImVec2 ItemInnerSpacing;
    ImVec2 CellPadding;
    ImVec2 TouchExtraPadding;
    float IndentSpacing = 0.0f;
    float ColumnsMinSpacing = 0.0f;
    float ScrollbarSize = 0.0f;
    float ScrollbarRounding = 0.0f;
    float GrabMinSize = 0.0f;
    float GrabRounding = 0.0f;
    float LogSliderDeadzone = 0.0f;
    float TabRounding = 0.0f;
    float TabBorderSize = 0.0f;
    float TabMinWidthForCloseButton = 0.0f;
    ImGuiDir ColorButtonPosition;
    ImVec2 ButtonTextAlign;
    ImVec2 SelectableTextAlign;
    float SeparatorTextBorderSize = 0.0f;
    ImVec2 SeparatorTextAlign;
    ImVec2 SeparatorTextPadding;
    ImVec2 DisplayWindowPadding;
    ImVec2 DisplaySafeAreaPadding;
    float MouseCursorScale = 0.0f;
    bool AntiAliasedLines;
    bool AntiAliasedLinesUseTex;
    bool AntiAliasedFill;
    float CurveTessellationTol = 0.0f;
    float CircleTessellationMaxError = 0.0f;
    ImVec4[ImGuiCol_.ImGuiCol_COUNT] Colors;
    float HoverStationaryDelay = 0.0f;
    float HoverDelayShort = 0.0f;
    float HoverDelayNormal = 0.0f;
    ImGuiHoveredFlags HoverFlagsForTooltipMouse;
    ImGuiHoveredFlags HoverFlagsForTooltipNav;
}

struct ImGuiKeyData
{
    bool Down;
    float DownDuration = 0.0f;
    float DownDurationPrev = 0.0f;
    float AnalogValue = 0.0f;
}

struct ImVector_ImWchar
{
    int Size;
    int Capacity;
    ImWchar* Data;
}

struct ImGuiIO
{
    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime = 0.0f;
    float IniSavingRate = 0.0f;
    const(char)* IniFilename;
    const(char)* LogFilename;
    void* UserData;
    ImFontAtlas* Fonts;
    float FontGlobalScale = 0.0f;
    bool FontAllowUserScaling;
    ImFont* FontDefault;
    ImVec2 DisplayFramebufferScale;
    bool MouseDrawCursor;
    bool ConfigMacOSXBehaviors;
    bool ConfigInputTrickleEventQueue;
    bool ConfigInputTextCursorBlink;
    bool ConfigInputTextEnterKeepActive;
    bool ConfigDragClickToInputText;
    bool ConfigWindowsResizeFromEdges;
    bool ConfigWindowsMoveFromTitleBarOnly;
    float ConfigMemoryCompactTimer = 0.0f;
    float MouseDoubleClickTime = 0.0f;
    float MouseDoubleClickMaxDist = 0.0f;
    float MouseDragThreshold = 0.0f;
    float KeyRepeatDelay = 0.0f;
    float KeyRepeatRate = 0.0f;
    bool ConfigDebugBeginReturnValueOnce;
    bool ConfigDebugBeginReturnValueLoop;
    bool ConfigDebugIgnoreFocusLoss;
    bool ConfigDebugIniSettings;
    const(char)* BackendPlatformName;
    const(char)* BackendRendererName;
    void* BackendPlatformUserData;
    void* BackendRendererUserData;
    void* BackendLanguageUserData;
    const(char)* function(void* user_data) GetClipboardTextFn;
    void function(void* user_data, const(char)* text) SetClipboardTextFn;
    void* ClipboardUserData;
    void function(ImGuiViewport* viewport, ImGuiPlatformImeData* data) SetPlatformImeDataFn;
    void* _UnusedPadding;
    ImWchar PlatformLocaleDecimalPoint;
    bool WantCaptureMouse;
    bool WantCaptureKeyboard;
    bool WantTextInput;
    bool WantSetMousePos;
    bool WantSaveIniSettings;
    bool NavActive;
    bool NavVisible;
    float Framerate = 0.0f;
    int MetricsRenderVertices;
    int MetricsRenderIndices;
    int MetricsRenderWindows;
    int MetricsActiveWindows;
    int MetricsActiveAllocations;
    ImVec2 MouseDelta;
    int[ImGuiKey.ImGuiKey_COUNT] KeyMap;
    bool[ImGuiKey.ImGuiKey_COUNT] KeysDown;
    float[ImGuiNavInput.ImGuiNavInput_COUNT] NavInputs;
    ImGuiContext* Ctx;
    ImVec2 MousePos;
    bool[5] MouseDown;
    float MouseWheel = 0.0f;
    float MouseWheelH = 0.0f;
    ImGuiMouseSource MouseSource;
    bool KeyCtrl;
    bool KeyShift;
    bool KeyAlt;
    bool KeySuper;
    ImGuiKeyChord KeyMods;
    ImGuiKeyData[ImGuiKey.ImGuiKey_KeysData_SIZE] KeysData;
    bool WantCaptureMouseUnlessPopupClose;
    ImVec2 MousePosPrev;
    ImVec2[5] MouseClickedPos;
    double[5] MouseClickedTime = 0.0;
    bool[5] MouseClicked;
    bool[5] MouseDoubleClicked;
    ImU16[5] MouseClickedCount;
    ImU16[5] MouseClickedLastCount;
    bool[5] MouseReleased;
    bool[5] MouseDownOwned;
    bool[5] MouseDownOwnedUnlessPopupClose;
    bool MouseWheelRequestAxisSwap;
    float[5] MouseDownDuration = 0.0f;
    float[5] MouseDownDurationPrev = 0.0f;
    float[5] MouseDragMaxDistanceSqr = 0.0f;
    float PenPressure = 0.0f;
    bool AppFocusLost;
    bool AppAcceptingEvents;
    ImS8 BackendUsingLegacyKeyArrays;
    bool BackendUsingLegacyNavInputArray;
    ImWchar16 InputQueueSurrogate;
    ImVector_ImWchar InputQueueCharacters;
}

struct ImGuiInputTextCallbackData
{
    ImGuiContext* Ctx;
    ImGuiInputTextFlags EventFlag;
    ImGuiInputTextFlags Flags;
    void* UserData;
    ImWchar EventChar;
    ImGuiKey EventKey;
    char* Buf;
    int BufTextLen;
    int BufSize;
    bool BufDirty;
    int CursorPos;
    int SelectionStart;
    int SelectionEnd;
}

struct ImGuiSizeCallbackData
{
    void* UserData;
    ImVec2 Pos;
    ImVec2 CurrentSize;
    ImVec2 DesiredSize;
}

struct ImGuiPayload
{
    void* Data;
    int DataSize;
    ImGuiID SourceId;
    ImGuiID SourceParentId;
    int DataFrameCount;
    char[33] DataType;
    bool Preview;
    bool Delivery;
}

struct ImGuiTableColumnSortSpecs
{
    import std.bitmanip : bitfields;

    ImGuiID ColumnUserID;
    ImS16 ColumnIndex;
    ImS16 SortOrder;
    mixin(bitfields!(ImGuiSortDirection, "SortDirection", 8));
}

struct ImGuiTableSortSpecs
{
    const(ImGuiTableColumnSortSpecs)* Specs;
    int SpecsCount;
    bool SpecsDirty;
}

struct ImGuiOnceUponAFrame
{
    int RefFrame;
}

struct ImGuiTextRange
{
    const(char)* b;
    const(char)* e;
}

struct ImVector_ImGuiTextRange
{
    int Size;
    int Capacity;
    ImGuiTextRange* Data;
}

struct ImGuiTextFilter
{
    char[256] InputBuf;
    ImVector_ImGuiTextRange Filters;
    int CountGrep;
}

struct ImVector_char
{
    int Size;
    int Capacity;
    char* Data;
}

struct ImGuiTextBuffer
{
    ImVector_char Buf;
}

struct ImGuiStoragePair
{
    ImGuiID key;
}

struct ImVector_ImGuiStoragePair
{
    int Size;
    int Capacity;
    ImGuiStoragePair* Data;
}

struct ImGuiStorage
{
    ImVector_ImGuiStoragePair Data;
}

struct ImGuiListClipper
{
    ImGuiContext* Ctx;
    int DisplayStart;
    int DisplayEnd;
    int ItemsCount;
    float ItemsHeight = 0.0f;
    float StartPosY = 0.0f;
    void* TempData;
}

struct ImColor
{
    ImVec4 Value;
}

alias ImDrawCallback = void function(const(ImDrawList)* parent_list, const(ImDrawCmd)* cmd);

struct ImDrawCmd
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    uint VtxOffset;
    uint IdxOffset;
    uint ElemCount;
    ImDrawCallback UserCallback;
    void* UserCallbackData;
}

struct ImDrawVert
{
    ImVec2 pos;
    ImVec2 uv;
    ImU32 col;
}

struct ImDrawCmdHeader
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    uint VtxOffset;
}

struct ImVector_ImDrawCmd
{
    int Size;
    int Capacity;
    ImDrawCmd* Data;
}

struct ImVector_ImDrawIdx
{
    int Size;
    int Capacity;
    ImDrawIdx* Data;
}

struct ImDrawChannel
{
    ImVector_ImDrawCmd _CmdBuffer;
    ImVector_ImDrawIdx _IdxBuffer;
}

struct ImVector_ImDrawChannel
{
    int Size;
    int Capacity;
    ImDrawChannel* Data;
}

struct ImDrawListSplitter
{
    int _Current;
    int _Count;
    ImVector_ImDrawChannel _Channels;
}

enum ImDrawFlags_
{
    ImDrawFlags_None = 0,
    ImDrawFlags_Closed = 1 << 0,
    ImDrawFlags_RoundCornersTopLeft = 1 << 4,
    ImDrawFlags_RoundCornersTopRight = 1 << 5,
    ImDrawFlags_RoundCornersBottomLeft = 1 << 6,
    ImDrawFlags_RoundCornersBottomRight = 1 << 7,
    ImDrawFlags_RoundCornersNone = 1 << 8,
    ImDrawFlags_RoundCornersTop = ImDrawFlags_RoundCornersTopLeft
        | ImDrawFlags_RoundCornersTopRight, ImDrawFlags_RoundCornersBottom
        = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersLeft = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft,
    ImDrawFlags_RoundCornersRight = ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight,
    ImDrawFlags_RoundCornersAll = ImDrawFlags_RoundCornersTopLeft
        | ImDrawFlags_RoundCornersTopRight | ImDrawFlags_RoundCornersBottomLeft
        | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersDefault_ = ImDrawFlags_RoundCornersAll,
    ImDrawFlags_RoundCornersMask_ = ImDrawFlags_RoundCornersAll | ImDrawFlags_RoundCornersNone
}

enum ImDrawListFlags_
{
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1 << 0,
    ImDrawListFlags_AntiAliasedLinesUseTex = 1 << 1,
    ImDrawListFlags_AntiAliasedFill = 1 << 2,
    ImDrawListFlags_AllowVtxOffset = 1 << 3
}

struct ImVector_ImDrawVert
{
    int Size;
    int Capacity;
    ImDrawVert* Data;
}

struct ImVector_ImVec4
{
    int Size;
    int Capacity;
    ImVec4* Data;
}

struct ImVector_ImTextureID
{
    int Size;
    int Capacity;
    ImTextureID* Data;
}

struct ImVector_ImVec2
{
    int Size;
    int Capacity;
    ImVec2* Data;
}

struct ImDrawList
{
    ImVector_ImDrawCmd CmdBuffer;
    ImVector_ImDrawIdx IdxBuffer;
    ImVector_ImDrawVert VtxBuffer;
    ImDrawListFlags Flags;
    uint _VtxCurrentIdx;
    ImDrawListSharedData* _Data;
    const(char)* _OwnerName;
    ImDrawVert* _VtxWritePtr;
    ImDrawIdx* _IdxWritePtr;
    ImVector_ImVec4 _ClipRectStack;
    ImVector_ImTextureID _TextureIdStack;
    ImVector_ImVec2 _Path;
    ImDrawCmdHeader _CmdHeader;
    ImDrawListSplitter _Splitter;
    float _FringeScale = 0.0f;
}

struct ImVector_ImDrawListPtr
{
    int Size;
    int Capacity;
    ImDrawList** Data;
}

struct ImDrawData
{
    bool Valid;
    int CmdListsCount;
    int TotalIdxCount;
    int TotalVtxCount;
    ImVector_ImDrawListPtr CmdLists;
    ImVec2 DisplayPos;
    ImVec2 DisplaySize;
    ImVec2 FramebufferScale;
    ImGuiViewport* OwnerViewport;
}

struct ImFontConfig
{
    void* FontData;
    int FontDataSize;
    bool FontDataOwnedByAtlas;
    int FontNo;
    float SizePixels = 0.0f;
    int OversampleH;
    int OversampleV;
    bool PixelSnapH;
    ImVec2 GlyphExtraSpacing;
    ImVec2 GlyphOffset;
    const(ImWchar)* GlyphRanges;
    float GlyphMinAdvanceX = 0.0f;
    float GlyphMaxAdvanceX = 0.0f;
    bool MergeMode;
    uint FontBuilderFlags;
    float RasterizerMultiply = 0.0f;
    ImWchar EllipsisChar;
    char[40] Name;
    ImFont* DstFont;
}

struct ImFontGlyph
{
    import std.bitmanip : bitfields;

    mixin(bitfields!(uint, "Colored", 1, uint, "Visible", 1, uint, "Codepoint", 30));

    float AdvanceX = 0.0f;
    float X0 = 0.0f;
    float Y0 = 0.0f;
    float X1 = 0.0f;
    float Y1 = 0.0f;
    float U0 = 0.0f;
    float V0 = 0.0f;
    float U1 = 0.0f;
    float V1 = 0.0f;
}

struct ImVector_ImU32
{
    int Size;
    int Capacity;
    ImU32* Data;
}

struct ImFontGlyphRangesBuilder
{
    ImVector_ImU32 UsedChars;
}

struct ImFontAtlasCustomRect
{
    ushort Width;
    ushort Height;
    ushort X;
    ushort Y;
    uint GlyphID;
    float GlyphAdvanceX = 0.0f;
    ImVec2 GlyphOffset;
    ImFont* Font;
}

enum ImFontAtlasFlags_
{
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1 << 0,
    ImFontAtlasFlags_NoMouseCursors = 1 << 1,
    ImFontAtlasFlags_NoBakedLines = 1 << 2
}

struct ImVector_ImFontPtr
{
    int Size;
    int Capacity;
    ImFont** Data;
}

struct ImVector_ImFontAtlasCustomRect
{
    int Size;
    int Capacity;
    ImFontAtlasCustomRect* Data;
}

struct ImVector_ImFontConfig
{
    int Size;
    int Capacity;
    ImFontConfig* Data;
}

struct ImFontAtlas
{
    ImFontAtlasFlags Flags;
    ImTextureID TexID;
    int TexDesiredWidth;
    int TexGlyphPadding;
    bool Locked;
    void* UserData;
    bool TexReady;
    bool TexPixelsUseColors;
    ubyte* TexPixelsAlpha8;
    uint* TexPixelsRGBA32;
    int TexWidth;
    int TexHeight;
    ImVec2 TexUvScale;
    ImVec2 TexUvWhitePixel;
    ImVector_ImFontPtr Fonts;
    ImVector_ImFontAtlasCustomRect CustomRects;
    ImVector_ImFontConfig ConfigData;
    ImVec4[64] TexUvLines;
    const(ImFontBuilderIO)* FontBuilderIO;
    uint FontBuilderFlags;
    int PackIdMouseCursors;
    int PackIdLines;
}

struct ImVector_float
{
    int Size;
    int Capacity;
    float* Data;
}

struct ImVector_ImFontGlyph
{
    int Size;
    int Capacity;
    ImFontGlyph* Data;
}

struct ImFont
{
    ImVector_float IndexAdvanceX;
    float FallbackAdvanceX = 0.0f;
    float FontSize = 0.0f;
    ImVector_ImWchar IndexLookup;
    ImVector_ImFontGlyph Glyphs;
    const(ImFontGlyph)* FallbackGlyph;
    ImFontAtlas* ContainerAtlas;
    const(ImFontConfig)* ConfigData;
    short ConfigDataCount;
    ImWchar FallbackChar;
    ImWchar EllipsisChar;
    short EllipsisCharCount;
    float EllipsisWidth = 0.0f;
    float EllipsisCharStep = 0.0f;
    bool DirtyLookupTables;
    float Scale = 0.0f;
    float Ascent = 0.0f;
    float Descent = 0.0f;
    int MetricsTotalSurface;
    ImU8[2] Used4kPagesMap;
}

enum ImGuiViewportFlags_
{
    ImGuiViewportFlags_None = 0,
    ImGuiViewportFlags_IsPlatformWindow = 1 << 0,
    ImGuiViewportFlags_IsPlatformMonitor = 1 << 1,
    ImGuiViewportFlags_OwnedByApp = 1 << 2
}

struct ImGuiViewport
{
    ImGuiViewportFlags Flags;
    ImVec2 Pos;
    ImVec2 Size;
    ImVec2 WorkPos;
    ImVec2 WorkSize;
    void* PlatformHandleRaw;
}

struct ImGuiPlatformImeData
{
    bool WantVisible;
    ImVec2 InputPos;
    float InputLineHeight = 0.0f;
}

alias ImGuiLayoutType = int;
alias ImGuiActivateFlags = int;
alias ImGuiDebugLogFlags = int;
alias ImGuiFocusRequestFlags = int;
alias ImGuiInputFlags = int;
alias ImGuiItemFlags = int;
alias ImGuiItemStatusFlags = int;
alias ImGuiOldColumnFlags = int;
alias ImGuiNavHighlightFlags = int;
alias ImGuiNavMoveFlags = int;
alias ImGuiNextItemDataFlags = int;
alias ImGuiNextWindowDataFlags = int;
alias ImGuiScrollFlags = int;
alias ImGuiSeparatorFlags = int;
alias ImGuiTextFlags = int;
alias ImGuiTooltipFlags = int;
alias ImGuiErrorLogCallback = void function(void* user_data, const(char)* fmt, ...);
extern __gshared ImGuiContext* GImGui;

struct StbUndoRecord
{
    int where;
    int insert_length;
    int delete_length;
    int char_storage;
}

struct StbUndoState
{
    StbUndoRecord[99] undo_rec;
    ImWchar[999] undo_char;
    short undo_point;
    short redo_point;
    int undo_char_point;
    int redo_char_point;
}

struct STB_TexteditState
{
    int cursor;
    int select_start;
    int select_end;
    ubyte insert_mode;
    int row_count_per_page;
    ubyte cursor_at_end_of_line;
    ubyte initialized;
    ubyte has_preferred_x;
    ubyte single_line;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    float preferred_x = 0.0f;
    StbUndoState undostate;
}

struct StbTexteditRow
{
    float x0 = 0.0f;
    float x1 = 0.0f;
    float baseline_y_delta = 0.0f;
    float ymin = 0.0f;
    float ymax = 0.0f;
    int num_chars;
}

struct ImVec1
{
    float x = 0.0f;
}

struct ImVec2ih
{
    short x;
    short y;
}

struct ImRect
{
    ImVec2 Min;
    ImVec2 Max;
}

alias ImBitArrayPtr = uint*;

struct ImBitVector
{
    ImVector_ImU32 Storage;
}

alias ImPoolIdx = int;

struct ImVector_int
{
    int Size;
    int Capacity;
    int* Data;
}

struct ImGuiTextIndex
{
    ImVector_int LineOffsets;
    int EndOffset;
}

struct ImDrawListSharedData
{
    ImVec2 TexUvWhitePixel;
    ImFont* Font;
    float FontSize = 0.0f;
    float CurveTessellationTol = 0.0f;
    float CircleSegmentMaxError = 0.0f;
    ImVec4 ClipRectFullscreen;
    ImDrawListFlags InitialFlags;
    ImVector_ImVec2 TempBuffer;
    ImVec2[48] ArcFastVtx;
    float ArcFastRadiusCutoff = 0.0f;
    ImU8[64] CircleSegmentCounts;
    const(ImVec4)* TexUvLines;
}

struct ImDrawDataBuilder
{
    ImVector_ImDrawListPtr*[2] Layers;
    ImVector_ImDrawListPtr LayerData1;
}

enum ImGuiItemFlags_
{
    ImGuiItemFlags_None = 0,
    ImGuiItemFlags_NoTabStop = 1 << 0,
    ImGuiItemFlags_ButtonRepeat = 1 << 1,
    ImGuiItemFlags_Disabled = 1 << 2,
    ImGuiItemFlags_NoNav = 1 << 3,
    ImGuiItemFlags_NoNavDefaultFocus = 1 << 4,
    ImGuiItemFlags_SelectableDontClosePopup = 1 << 5,
    ImGuiItemFlags_MixedValue = 1 << 6,
    ImGuiItemFlags_ReadOnly = 1 << 7,
    ImGuiItemFlags_NoWindowHoverableCheck = 1 << 8,
    ImGuiItemFlags_AllowOverlap = 1 << 9,
    ImGuiItemFlags_Inputable = 1 << 10
}

enum ImGuiItemStatusFlags_
{
    ImGuiItemStatusFlags_None = 0,
    ImGuiItemStatusFlags_HoveredRect = 1 << 0,
    ImGuiItemStatusFlags_HasDisplayRect = 1 << 1,
    ImGuiItemStatusFlags_Edited = 1 << 2,
    ImGuiItemStatusFlags_ToggledSelection = 1 << 3,
    ImGuiItemStatusFlags_ToggledOpen = 1 << 4,
    ImGuiItemStatusFlags_HasDeactivated = 1 << 5,
    ImGuiItemStatusFlags_Deactivated = 1 << 6,
    ImGuiItemStatusFlags_HoveredWindow = 1 << 7,
    ImGuiItemStatusFlags_FocusedByTabbing = 1 << 8,
    ImGuiItemStatusFlags_Visible = 1 << 9
}

// enum ImGuiHoveredFlagsPrivate_
// {
//     ImGuiHoveredFlags_DelayMask_ = ImGuiHoveredFlags_.ImGuiHoveredFlags_DelayNone
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_DelayShort | ImGuiHoveredFlags_
//             .ImGuiHoveredFlags_DelayNormal | ImGuiHoveredFlags_.ImGuiHoveredFlags_NoSharedDelay,
//         ImGuiHoveredFlags_AllowedMaskForIsWindowHovered
//         = ImGuiHoveredFlags_.ImGuiHoveredFlags_ChildWindows
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_RootWindow
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_AnyWindow | ImGuiHoveredFlags_.ImGuiHoveredFlags_NoPopupHierarchy | ImGuiHoveredFlags_
//             .ImGuiHoveredFlags_AllowWhenBlockedByPopup
//             | ImGuiHoveredFlags_.ImGuiHoveredFlags_AllowWhenBlockedByActiveItem
//             | ImGuiHoveredFlags_.ImGuiHoveredFlags_ForTooltip
//             | ImGuiHoveredFlags_.ImGuiHoveredFlags_Stationary,
//         ImGuiHoveredFlags_AllowedMaskForIsItemHovered
//         = ImGuiHoveredFlags_.ImGuiHoveredFlags_AllowWhenBlockedByPopup
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_AllowWhenBlockedByActiveItem
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_AllowWhenOverlapped
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_AllowWhenDisabled
//         | ImGuiHoveredFlags_.ImGuiHoveredFlags_NoNavOverride | ImGuiHoveredFlags_
//             .ImGuiHoveredFlags_ForTooltip | ImGuiHoveredFlags_
//             .ImGuiHoveredFlags_Stationary | ImGuiHoveredFlags_DelayMask_
// }

enum ImGuiInputTextFlagsPrivate_
{
    ImGuiInputTextFlags_Multiline = 1 << 26,
    ImGuiInputTextFlags_NoMarkEdited = 1 << 27,
    ImGuiInputTextFlags_MergedItem = 1 << 28
}

enum ImGuiButtonFlagsPrivate_
{
    ImGuiButtonFlags_PressedOnClick = 1 << 4,
    ImGuiButtonFlags_PressedOnClickRelease = 1 << 5,
    ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 1 << 6,
    ImGuiButtonFlags_PressedOnRelease = 1 << 7,
    ImGuiButtonFlags_PressedOnDoubleClick = 1 << 8,
    ImGuiButtonFlags_PressedOnDragDropHold = 1 << 9,
    ImGuiButtonFlags_Repeat = 1 << 10,
    ImGuiButtonFlags_FlattenChildren = 1 << 11,
    ImGuiButtonFlags_AllowOverlap = 1 << 12,
    ImGuiButtonFlags_DontClosePopups = 1 << 13,
    ImGuiButtonFlags_AlignTextBaseLine = 1 << 15,
    ImGuiButtonFlags_NoKeyModifiers = 1 << 16,
    ImGuiButtonFlags_NoHoldingActiveId = 1 << 17,
    ImGuiButtonFlags_NoNavFocus = 1 << 18,
    ImGuiButtonFlags_NoHoveredOnFocus = 1 << 19,
    ImGuiButtonFlags_NoSetKeyOwner = 1 << 20,
    ImGuiButtonFlags_NoTestKeyOwner = 1 << 21,
    ImGuiButtonFlags_PressedOnMask_
        = ImGuiButtonFlags_PressedOnClick | ImGuiButtonFlags_PressedOnClickRelease
        | ImGuiButtonFlags_PressedOnClickReleaseAnywhere
        | ImGuiButtonFlags_PressedOnRelease | ImGuiButtonFlags_PressedOnDoubleClick
        | ImGuiButtonFlags_PressedOnDragDropHold,
    ImGuiButtonFlags_PressedOnDefault_ = ImGuiButtonFlags_PressedOnClickRelease
}

enum ImGuiComboFlagsPrivate_
{
    ImGuiComboFlags_CustomPreview = 1 << 20
}

enum ImGuiSliderFlagsPrivate_
{
    ImGuiSliderFlags_Vertical = 1 << 20,
    ImGuiSliderFlags_ReadOnly = 1 << 21
}

enum ImGuiSelectableFlagsPrivate_
{
    ImGuiSelectableFlags_NoHoldingActiveID = 1 << 20,
    ImGuiSelectableFlags_SelectOnNav = 1 << 21,
    ImGuiSelectableFlags_SelectOnClick = 1 << 22,
    ImGuiSelectableFlags_SelectOnRelease = 1 << 23,
    ImGuiSelectableFlags_SpanAvailWidth = 1 << 24,
    ImGuiSelectableFlags_SetNavIdOnHover = 1 << 25,
    ImGuiSelectableFlags_NoPadWithHalfSpacing = 1 << 26,
    ImGuiSelectableFlags_NoSetKeyOwner = 1 << 27
}

enum ImGuiTreeNodeFlagsPrivate_
{
    ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1 << 20,
    ImGuiTreeNodeFlags_UpsideDownArrow = 1 << 21
}

enum ImGuiSeparatorFlags_
{
    ImGuiSeparatorFlags_None = 0,
    ImGuiSeparatorFlags_Horizontal = 1 << 0,
    ImGuiSeparatorFlags_Vertical = 1 << 1,
    ImGuiSeparatorFlags_SpanAllColumns = 1 << 2
}

enum ImGuiFocusRequestFlags_
{
    ImGuiFocusRequestFlags_None = 0,
    ImGuiFocusRequestFlags_RestoreFocusedChild = 1 << 0,
    ImGuiFocusRequestFlags_UnlessBelowModal = 1 << 1
}

enum ImGuiTextFlags_
{
    ImGuiTextFlags_None = 0,
    ImGuiTextFlags_NoWidthForLargeClippedText = 1 << 0
}

enum ImGuiTooltipFlags_
{
    ImGuiTooltipFlags_None = 0,
    ImGuiTooltipFlags_OverridePrevious = 1 << 1
}

enum ImGuiLayoutType_
{
    ImGuiLayoutType_Horizontal = 0,
    ImGuiLayoutType_Vertical = 1
}

enum ImGuiLogType
{
    ImGuiLogType_None = 0,
    ImGuiLogType_TTY = 1,
    ImGuiLogType_File = 2,
    ImGuiLogType_Buffer = 3,
    ImGuiLogType_Clipboard = 4
}

enum ImGuiAxis
{
    ImGuiAxis_None = -1,
    ImGuiAxis_X = 0,
    ImGuiAxis_Y = 1
}

enum ImGuiPlotType
{
    ImGuiPlotType_Lines = 0,
    ImGuiPlotType_Histogram = 1
}

enum ImGuiPopupPositionPolicy
{
    ImGuiPopupPositionPolicy_Default = 0,
    ImGuiPopupPositionPolicy_ComboBox = 1,
    ImGuiPopupPositionPolicy_Tooltip = 2
}

struct ImGuiDataVarInfo
{
    ImGuiDataType Type;
    ImU32 Count;
    ImU32 Offset;
}

struct ImGuiDataTypeTempStorage
{
    ImU8[8] Data;
}

struct ImGuiDataTypeInfo
{
    size_t Size;
    const(char)* Name;
    const(char)* PrintFmt;
    const(char)* ScanFmt;
}

enum ImGuiDataTypePrivate_
{
    ImGuiDataType_String = ImGuiDataType_.ImGuiDataType_COUNT + 1,
    ImGuiDataType_Pointer = 12,
    ImGuiDataType_ID = 13
}

struct ImGuiColorMod
{
    ImGuiCol Col;
    ImVec4 BackupValue;
}

struct ImGuiStyleMod
{
    ImGuiStyleVar VarIdx;
}

struct ImGuiComboPreviewData
{
    ImRect PreviewRect;
    ImVec2 BackupCursorPos;
    ImVec2 BackupCursorMaxPos;
    ImVec2 BackupCursorPosPrevLine;
    float BackupPrevLineTextBaseOffset = 0.0f;
    ImGuiLayoutType BackupLayout;
}

struct ImGuiGroupData
{
    ImGuiID WindowID;
    ImVec2 BackupCursorPos;
    ImVec2 BackupCursorMaxPos;
    ImVec1 BackupIndent;
    ImVec1 BackupGroupOffset;
    ImVec2 BackupCurrLineSize;
    float BackupCurrLineTextBaseOffset = 0.0f;
    ImGuiID BackupActiveIdIsAlive;
    bool BackupActiveIdPreviousFrameIsAlive;
    bool BackupHoveredIdIsAlive;
    bool EmitItem;
}

struct ImGuiMenuColumns
{
    ImU32 TotalWidth;
    ImU32 NextTotalWidth;
    ImU16 Spacing;
    ImU16 OffsetIcon;
    ImU16 OffsetLabel;
    ImU16 OffsetShortcut;
    ImU16 OffsetMark;
    ImU16[4] Widths;
}

struct ImGuiInputTextDeactivatedState
{
    ImGuiID ID;
    ImVector_char TextA;
}

struct ImGuiInputTextState
{
    ImGuiContext* Ctx;
    ImGuiID ID;
    int CurLenW;
    int CurLenA;
    ImVector_ImWchar TextW;
    ImVector_char TextA;
    ImVector_char InitialTextA;
    bool TextAIsValid;
    int BufCapacityA;
    float ScrollX = 0.0f;
    STB_TexteditState Stb;
    float CursorAnim = 0.0f;
    bool CursorFollow;
    bool SelectedAllMouseLock;
    bool Edited;
    ImGuiInputTextFlags Flags;
}

struct ImGuiPopupData
{
    ImGuiID PopupId;
    ImGuiWindow* Window;
    ImGuiWindow* BackupNavWindow;
    int ParentNavLayer;
    int OpenFrameCount;
    ImGuiID OpenParentId;
    ImVec2 OpenPopupPos;
    ImVec2 OpenMousePos;
}

enum ImGuiNextWindowDataFlags_
{
    ImGuiNextWindowDataFlags_None = 0,
    ImGuiNextWindowDataFlags_HasPos = 1 << 0,
    ImGuiNextWindowDataFlags_HasSize = 1 << 1,
    ImGuiNextWindowDataFlags_HasContentSize = 1 << 2,
    ImGuiNextWindowDataFlags_HasCollapsed = 1 << 3,
    ImGuiNextWindowDataFlags_HasSizeConstraint = 1 << 4,
    ImGuiNextWindowDataFlags_HasFocus = 1 << 5,
    ImGuiNextWindowDataFlags_HasBgAlpha = 1 << 6,
    ImGuiNextWindowDataFlags_HasScroll = 1 << 7
}

struct ImGuiNextWindowData
{
    ImGuiNextWindowDataFlags Flags;
    ImGuiCond PosCond;
    ImGuiCond SizeCond;
    ImGuiCond CollapsedCond;
    ImVec2 PosVal;
    ImVec2 PosPivotVal;
    ImVec2 SizeVal;
    ImVec2 ContentSizeVal;
    ImVec2 ScrollVal;
    bool CollapsedVal;
    ImRect SizeConstraintRect;
    ImGuiSizeCallback SizeCallback;
    void* SizeCallbackUserData;
    float BgAlphaVal = 0.0f;
    ImVec2 MenuBarOffsetMinVal;
}

enum ImGuiNextItemDataFlags_
{
    ImGuiNextItemDataFlags_None = 0,
    ImGuiNextItemDataFlags_HasWidth = 1 << 0,
    ImGuiNextItemDataFlags_HasOpen = 1 << 1
}

struct ImGuiNextItemData
{
    ImGuiNextItemDataFlags Flags;
    ImGuiItemFlags ItemFlags;
    float Width = 0.0f;
    ImGuiID FocusScopeId;
    ImGuiCond OpenCond;
    bool OpenVal;
}

struct ImGuiLastItemData
{
    ImGuiID ID;
    ImGuiItemFlags InFlags;
    ImGuiItemStatusFlags StatusFlags;
    ImRect Rect;
    ImRect NavRect;
    ImRect DisplayRect;
}

struct ImGuiNavTreeNodeData
{
    ImGuiID ID;
    ImGuiItemFlags InFlags;
    ImRect NavRect;
}

struct ImGuiStackSizes
{
    short SizeOfIDStack;
    short SizeOfColorStack;
    short SizeOfStyleVarStack;
    short SizeOfFontStack;
    short SizeOfFocusScopeStack;
    short SizeOfGroupStack;
    short SizeOfItemFlagsStack;
    short SizeOfBeginPopupStack;
    short SizeOfDisabledStack;
}

struct ImGuiWindowStackData
{
    ImGuiWindow* Window;
    ImGuiLastItemData ParentLastItemDataBackup;
    ImGuiStackSizes StackSizesOnBegin;
}

struct ImGuiShrinkWidthItem
{
    int Index;
    float Width = 0.0f;
    float InitialWidth = 0.0f;
}

struct ImGuiPtrOrIndex
{
    void* Ptr;
    int Index;
}

struct ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN
{
    ImU32[5] Storage;
}

alias ImBitArrayForNamedKeys = ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;

enum ImGuiInputEventType
{
    ImGuiInputEventType_None = 0,
    ImGuiInputEventType_MousePos = 1,
    ImGuiInputEventType_MouseWheel = 2,
    ImGuiInputEventType_MouseButton = 3,
    ImGuiInputEventType_Key = 4,
    ImGuiInputEventType_Text = 5,
    ImGuiInputEventType_Focus = 6,
    ImGuiInputEventType_COUNT = 7
}

enum ImGuiInputSource
{
    ImGuiInputSource_None = 0,
    ImGuiInputSource_Mouse = 1,
    ImGuiInputSource_Keyboard = 2,
    ImGuiInputSource_Gamepad = 3,
    ImGuiInputSource_Clipboard = 4,
    ImGuiInputSource_COUNT = 5
}

struct ImGuiInputEventMousePos
{
    float PosX = 0.0f;
    float PosY = 0.0f;
    ImGuiMouseSource MouseSource;
}

struct ImGuiInputEventMouseWheel
{
    float WheelX = 0.0f;
    float WheelY = 0.0f;
    ImGuiMouseSource MouseSource;
}

struct ImGuiInputEventMouseButton
{
    int Button;
    bool Down;
    ImGuiMouseSource MouseSource;
}

struct ImGuiInputEventKey
{
    ImGuiKey Key;
    bool Down;
    float AnalogValue = 0.0f;
}

struct ImGuiInputEventText
{
    uint Char;
}

struct ImGuiInputEventAppFocused
{
    bool Focused;
}

struct ImGuiInputEvent
{
    ImGuiInputEventType Type;
    ImGuiInputSource Source;
    ImU32 EventId;

    bool AddedByTestEngine;
}

alias ImGuiKeyRoutingIndex = short;

struct ImGuiKeyRoutingData
{
    ImGuiKeyRoutingIndex NextEntryIndex;
    ImU16 Mods;
    ImU8 RoutingNextScore;
    ImGuiID RoutingCurr;
    ImGuiID RoutingNext;
}

struct ImVector_ImGuiKeyRoutingData
{
    int Size;
    int Capacity;
    ImGuiKeyRoutingData* Data;
}

struct ImGuiKeyRoutingTable
{
    ImGuiKeyRoutingIndex[ImGuiKey.ImGuiKey_NamedKey_COUNT] Index;
    ImVector_ImGuiKeyRoutingData Entries;
    ImVector_ImGuiKeyRoutingData EntriesNext;
}

struct ImGuiKeyOwnerData
{
    ImGuiID OwnerCurr;
    ImGuiID OwnerNext;
    bool LockThisFrame;
    bool LockUntilRelease;
}

enum ImGuiInputFlags_
{
    ImGuiInputFlags_None = 0,
    ImGuiInputFlags_Repeat = 1 << 0,
    ImGuiInputFlags_RepeatRateDefault = 1 << 1,
    ImGuiInputFlags_RepeatRateNavMove = 1 << 2,
    ImGuiInputFlags_RepeatRateNavTweak = 1 << 3,
    ImGuiInputFlags_RepeatRateMask_ = ImGuiInputFlags_RepeatRateDefault
        | ImGuiInputFlags_RepeatRateNavMove | ImGuiInputFlags_RepeatRateNavTweak,
    ImGuiInputFlags_CondHovered = 1 << 4,
    ImGuiInputFlags_CondActive = 1 << 5,
    ImGuiInputFlags_CondDefault_ = ImGuiInputFlags_CondHovered | ImGuiInputFlags_CondActive,
    ImGuiInputFlags_CondMask_ = ImGuiInputFlags_CondHovered | ImGuiInputFlags_CondActive,
    ImGuiInputFlags_LockThisFrame = 1 << 6,
    ImGuiInputFlags_LockUntilRelease = 1 << 7,
    ImGuiInputFlags_RouteFocused = 1 << 8,
    ImGuiInputFlags_RouteGlobalLow = 1 << 9,
    ImGuiInputFlags_RouteGlobal = 1 << 10,
    ImGuiInputFlags_RouteGlobalHigh = 1 << 11,
    ImGuiInputFlags_RouteMask_ = ImGuiInputFlags_RouteFocused
        | ImGuiInputFlags_RouteGlobal | ImGuiInputFlags_RouteGlobalLow | ImGuiInputFlags_RouteGlobalHigh,
    ImGuiInputFlags_RouteAlways = 1 << 12,
    ImGuiInputFlags_RouteUnlessBgFocused = 1 << 13,
    ImGuiInputFlags_RouteExtraMask_
        = ImGuiInputFlags_RouteAlways | ImGuiInputFlags_RouteUnlessBgFocused,
    ImGuiInputFlags_SupportedByIsKeyPressed = ImGuiInputFlags_Repeat | ImGuiInputFlags_RepeatRateMask_,
    ImGuiInputFlags_SupportedByShortcut = ImGuiInputFlags_Repeat
        | ImGuiInputFlags_RepeatRateMask_ | ImGuiInputFlags_RouteMask_ | ImGuiInputFlags_RouteExtraMask_,
    ImGuiInputFlags_SupportedBySetKeyOwner = ImGuiInputFlags_LockThisFrame | ImGuiInputFlags_LockUntilRelease,
    ImGuiInputFlags_SupportedBySetItemKeyOwner = ImGuiInputFlags_SupportedBySetKeyOwner
        | ImGuiInputFlags_CondMask_
}

struct ImGuiListClipperRange
{
    int Min;
    int Max;
    bool PosToIndexConvert;
    ImS8 PosToIndexOffsetMin;
    ImS8 PosToIndexOffsetMax;
}

struct ImVector_ImGuiListClipperRange
{
    int Size;
    int Capacity;
    ImGuiListClipperRange* Data;
}

struct ImGuiListClipperData
{
    ImGuiListClipper* ListClipper;
    float LossynessOffset = 0.0f;
    int StepNo;
    int ItemsFrozen;
    ImVector_ImGuiListClipperRange Ranges;
}

enum ImGuiActivateFlags_
{
    ImGuiActivateFlags_None = 0,
    ImGuiActivateFlags_PreferInput = 1 << 0,
    ImGuiActivateFlags_PreferTweak = 1 << 1,
    ImGuiActivateFlags_TryToPreserveState = 1 << 2
}

enum ImGuiScrollFlags_
{
    ImGuiScrollFlags_None = 0,
    ImGuiScrollFlags_KeepVisibleEdgeX = 1 << 0,
    ImGuiScrollFlags_KeepVisibleEdgeY = 1 << 1,
    ImGuiScrollFlags_KeepVisibleCenterX = 1 << 2,
    ImGuiScrollFlags_KeepVisibleCenterY = 1 << 3,
    ImGuiScrollFlags_AlwaysCenterX = 1 << 4,
    ImGuiScrollFlags_AlwaysCenterY = 1 << 5,
    ImGuiScrollFlags_NoScrollParent = 1 << 6,
    ImGuiScrollFlags_MaskX_ = ImGuiScrollFlags_KeepVisibleEdgeX
        | ImGuiScrollFlags_KeepVisibleCenterX | ImGuiScrollFlags_AlwaysCenterX,
    ImGuiScrollFlags_MaskY_ = ImGuiScrollFlags_KeepVisibleEdgeY
        | ImGuiScrollFlags_KeepVisibleCenterY | ImGuiScrollFlags_AlwaysCenterY
}

enum ImGuiNavHighlightFlags_
{
    ImGuiNavHighlightFlags_None = 0,
    ImGuiNavHighlightFlags_TypeDefault = 1 << 0,
    ImGuiNavHighlightFlags_TypeThin = 1 << 1,
    ImGuiNavHighlightFlags_AlwaysDraw = 1 << 2,
    ImGuiNavHighlightFlags_NoRounding = 1 << 3
}

enum ImGuiNavMoveFlags_
{
    ImGuiNavMoveFlags_None = 0,
    ImGuiNavMoveFlags_LoopX = 1 << 0,
    ImGuiNavMoveFlags_LoopY = 1 << 1,
    ImGuiNavMoveFlags_WrapX = 1 << 2,
    ImGuiNavMoveFlags_WrapY = 1 << 3,
    ImGuiNavMoveFlags_WrapMask_ = ImGuiNavMoveFlags_LoopX
        | ImGuiNavMoveFlags_LoopY | ImGuiNavMoveFlags_WrapX | ImGuiNavMoveFlags_WrapY,
    ImGuiNavMoveFlags_AllowCurrentNavId = 1 << 4,
    ImGuiNavMoveFlags_AlsoScoreVisibleSet = 1 << 5,
    ImGuiNavMoveFlags_ScrollToEdgeY = 1 << 6,
    ImGuiNavMoveFlags_Forwarded = 1 << 7,
    ImGuiNavMoveFlags_DebugNoResult = 1 << 8,
    ImGuiNavMoveFlags_FocusApi = 1 << 9,
    ImGuiNavMoveFlags_IsTabbing = 1 << 10,
    ImGuiNavMoveFlags_IsPageMove = 1 << 11,
    ImGuiNavMoveFlags_Activate = 1 << 12,
    ImGuiNavMoveFlags_NoSelect = 1 << 13,
    ImGuiNavMoveFlags_NoSetNavHighlight = 1 << 14
}

enum ImGuiNavLayer
{
    ImGuiNavLayer_Main = 0,
    ImGuiNavLayer_Menu = 1,
    ImGuiNavLayer_COUNT = 2
}

struct ImGuiNavItemData
{
    ImGuiWindow* Window;
    ImGuiID ID;
    ImGuiID FocusScopeId;
    ImRect RectRel;
    ImGuiItemFlags InFlags;
    float DistBox = 0.0f;
    float DistCenter = 0.0f;
    float DistAxial = 0.0f;
}

enum ImGuiOldColumnFlags_
{
    ImGuiOldColumnFlags_None = 0,
    ImGuiOldColumnFlags_NoBorder = 1 << 0,
    ImGuiOldColumnFlags_NoResize = 1 << 1,
    ImGuiOldColumnFlags_NoPreserveWidths = 1 << 2,
    ImGuiOldColumnFlags_NoForceWithinWindow = 1 << 3,
    ImGuiOldColumnFlags_GrowParentContentsSize = 1 << 4
}

struct ImGuiOldColumnData
{
    float OffsetNorm = 0.0f;
    float OffsetNormBeforeResize = 0.0f;
    ImGuiOldColumnFlags Flags;
    ImRect ClipRect;
}

struct ImVector_ImGuiOldColumnData
{
    int Size;
    int Capacity;
    ImGuiOldColumnData* Data;
}

struct ImGuiOldColumns
{
    ImGuiID ID;
    ImGuiOldColumnFlags Flags;
    bool IsFirstFrame;
    bool IsBeingResized;
    int Current;
    int Count;
    float OffMinX = 0.0f;
    float OffMaxX = 0.0f;
    float LineMinY = 0.0f;
    float LineMaxY = 0.0f;
    float HostCursorPosY = 0.0f;
    float HostCursorMaxPosX = 0.0f;
    ImRect HostInitialClipRect;
    ImRect HostBackupClipRect;
    ImRect HostBackupParentWorkRect;
    ImVector_ImGuiOldColumnData Columns;
    ImDrawListSplitter Splitter;
}

struct ImGuiViewportP
{
    ImGuiViewport _ImGuiViewport;
    int[2] BgFgDrawListsLastFrame;
    ImDrawList*[2] BgFgDrawLists;
    ImDrawData DrawDataP;
    ImDrawDataBuilder DrawDataBuilder;
    ImVec2 WorkOffsetMin;
    ImVec2 WorkOffsetMax;
    ImVec2 BuildWorkOffsetMin;
    ImVec2 BuildWorkOffsetMax;
}

struct ImGuiWindowSettings
{
    ImGuiID ID;
    ImVec2ih Pos;
    ImVec2ih Size;
    bool Collapsed;
    bool WantApply;
    bool WantDelete;
}

struct ImGuiSettingsHandler
{
    const(char)* TypeName;
    ImGuiID TypeHash;
    void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ClearAllFn;
    void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ReadInitFn;
    void* function(ImGuiContext* ctx, ImGuiSettingsHandler* handler, const(char)* name) ReadOpenFn;
    void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler,
            void* entry, const(char)* line) ReadLineFn;
    void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ApplyAllFn;
    void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ImGuiTextBuffer* out_buf) WriteAllFn;
    void* UserData;
}

enum ImGuiLocKey
{
    ImGuiLocKey_VersionStr = 0,
    ImGuiLocKey_TableSizeOne = 1,
    ImGuiLocKey_TableSizeAllFit = 2,
    ImGuiLocKey_TableSizeAllDefault = 3,
    ImGuiLocKey_TableResetOrder = 4,
    ImGuiLocKey_WindowingMainMenuBar = 5,
    ImGuiLocKey_WindowingPopup = 6,
    ImGuiLocKey_WindowingUntitled = 7,
    ImGuiLocKey_COUNT = 8
}

struct ImGuiLocEntry
{
    ImGuiLocKey Key;
    const(char)* Text;
}

enum ImGuiDebugLogFlags_
{
    ImGuiDebugLogFlags_None = 0,
    ImGuiDebugLogFlags_EventActiveId = 1 << 0,
    ImGuiDebugLogFlags_EventFocus = 1 << 1,
    ImGuiDebugLogFlags_EventPopup = 1 << 2,
    ImGuiDebugLogFlags_EventNav = 1 << 3,
    ImGuiDebugLogFlags_EventClipper = 1 << 4,
    ImGuiDebugLogFlags_EventSelection = 1 << 5,
    ImGuiDebugLogFlags_EventIO = 1 << 6,
    ImGuiDebugLogFlags_EventMask_ = ImGuiDebugLogFlags_EventActiveId
        | ImGuiDebugLogFlags_EventFocus | ImGuiDebugLogFlags_EventPopup | ImGuiDebugLogFlags_EventNav
        | ImGuiDebugLogFlags_EventClipper | ImGuiDebugLogFlags_EventSelection
        | ImGuiDebugLogFlags_EventIO, ImGuiDebugLogFlags_OutputToTTY = 1 << 10
}

struct ImGuiMetricsConfig
{
    bool ShowDebugLog;
    bool ShowStackTool;
    bool ShowWindowsRects;
    bool ShowWindowsBeginOrder;
    bool ShowTablesRects;
    bool ShowDrawCmdMesh;
    bool ShowDrawCmdBoundingBoxes;
    bool ShowAtlasTintedWithTextColor;
    int ShowWindowsRectsType;
    int ShowTablesRectsType;
}

struct ImGuiStackLevelInfo
{
    import std.bitmanip : bitfields;

    ImGuiID ID;
    ImS8 QueryFrameCount;
    bool QuerySuccess;
    mixin(bitfields!(ImGuiDataType, "DataType", 8));

    char[57] Desc;
}

struct ImVector_ImGuiStackLevelInfo
{
    int Size;
    int Capacity;
    ImGuiStackLevelInfo* Data;
}

struct ImGuiStackTool
{
    int LastActiveFrame;
    int StackLevel;
    ImGuiID QueryId;
    ImVector_ImGuiStackLevelInfo Results;
    bool CopyToClipboardOnCtrlC;
    float CopyToClipboardLastTime = 0.0f;
}

alias ImGuiContextHookCallback = void function(ImGuiContext* ctx, ImGuiContextHook* hook);

enum ImGuiContextHookType
{
    ImGuiContextHookType_NewFramePre = 0,
    ImGuiContextHookType_NewFramePost = 1,
    ImGuiContextHookType_EndFramePre = 2,
    ImGuiContextHookType_EndFramePost = 3,
    ImGuiContextHookType_RenderPre = 4,
    ImGuiContextHookType_RenderPost = 5,
    ImGuiContextHookType_Shutdown = 6,
    ImGuiContextHookType_PendingRemoval_ = 7
}

struct ImGuiContextHook
{
    ImGuiID HookId;
    ImGuiContextHookType Type;
    ImGuiID Owner;
    ImGuiContextHookCallback Callback;
    void* UserData;
}

struct ImVector_ImGuiInputEvent
{
    int Size;
    int Capacity;
    ImGuiInputEvent* Data;
}

struct ImVector_ImGuiWindowPtr
{
    int Size;
    int Capacity;
    ImGuiWindow** Data;
}

struct ImVector_ImGuiWindowStackData
{
    int Size;
    int Capacity;
    ImGuiWindowStackData* Data;
}

struct ImVector_ImGuiColorMod
{
    int Size;
    int Capacity;
    ImGuiColorMod* Data;
}

struct ImVector_ImGuiStyleMod
{
    int Size;
    int Capacity;
    ImGuiStyleMod* Data;
}

struct ImVector_ImGuiID
{
    int Size;
    int Capacity;
    ImGuiID* Data;
}

struct ImVector_ImGuiItemFlags
{
    int Size;
    int Capacity;
    ImGuiItemFlags* Data;
}

struct ImVector_ImGuiGroupData
{
    int Size;
    int Capacity;
    ImGuiGroupData* Data;
}

struct ImVector_ImGuiPopupData
{
    int Size;
    int Capacity;
    ImGuiPopupData* Data;
}

struct ImVector_ImGuiNavTreeNodeData
{
    int Size;
    int Capacity;
    ImGuiNavTreeNodeData* Data;
}

struct ImVector_ImGuiViewportPPtr
{
    int Size;
    int Capacity;
    ImGuiViewportP** Data;
}

struct ImVector_unsigned_char
{
    int Size;
    int Capacity;
    ubyte* Data;
}

struct ImVector_ImGuiListClipperData
{
    int Size;
    int Capacity;
    ImGuiListClipperData* Data;
}

struct ImVector_ImGuiTableTempData
{
    int Size;
    int Capacity;
    ImGuiTableTempData* Data;
}

struct ImVector_ImGuiTable
{
    int Size;
    int Capacity;
    ImGuiTable* Data;
}

struct ImPool_ImGuiTable
{
    ImVector_ImGuiTable Buf;
    ImGuiStorage Map;
    ImPoolIdx FreeIdx;
    ImPoolIdx AliveCount;
}

struct ImVector_ImGuiTabBar
{
    int Size;
    int Capacity;
    ImGuiTabBar* Data;
}

struct ImPool_ImGuiTabBar
{
    ImVector_ImGuiTabBar Buf;
    ImGuiStorage Map;
    ImPoolIdx FreeIdx;
    ImPoolIdx AliveCount;
}

struct ImVector_ImGuiPtrOrIndex
{
    int Size;
    int Capacity;
    ImGuiPtrOrIndex* Data;
}

struct ImVector_ImGuiShrinkWidthItem
{
    int Size;
    int Capacity;
    ImGuiShrinkWidthItem* Data;
}

struct ImVector_ImGuiSettingsHandler
{
    int Size;
    int Capacity;
    ImGuiSettingsHandler* Data;
}

struct ImChunkStream_ImGuiWindowSettings
{
    ImVector_char Buf;
}

struct ImChunkStream_ImGuiTableSettings
{
    ImVector_char Buf;
}

struct ImVector_ImGuiContextHook
{
    int Size;
    int Capacity;
    ImGuiContextHook* Data;
}

struct ImGuiContext
{
    bool Initialized;
    bool FontAtlasOwnedByContext;
    ImGuiIO IO;
    ImGuiStyle Style;
    ImFont* Font;
    float FontSize = 0.0f;
    float FontBaseSize = 0.0f;
    ImDrawListSharedData DrawListSharedData;
    double Time = 0.0;
    int FrameCount = 0;
    int FrameCountEnded = 0;
    int FrameCountRendered = 0;
    bool WithinFrameScope;
    bool WithinFrameScopeWithImplicitWindow;
    bool WithinEndChild;
    bool GcCompactAll;
    bool TestEngineHookItems;
    void* TestEngine;
    ImVector_ImGuiInputEvent InputEventsQueue;
    ImVector_ImGuiInputEvent InputEventsTrail;
    ImGuiMouseSource InputEventsNextMouseSource;
    ImU32 InputEventsNextEventId;
    ImVector_ImGuiWindowPtr Windows;
    ImVector_ImGuiWindowPtr WindowsFocusOrder;
    ImVector_ImGuiWindowPtr WindowsTempSortBuffer;
    ImVector_ImGuiWindowStackData CurrentWindowStack;
    ImGuiStorage WindowsById;
    int WindowsActiveCount;
    ImVec2 WindowsHoverPadding;
    ImGuiWindow* CurrentWindow;
    ImGuiWindow* HoveredWindow;
    ImGuiWindow* HoveredWindowUnderMovingWindow;
    ImGuiWindow* MovingWindow;
    ImGuiWindow* WheelingWindow;
    ImVec2 WheelingWindowRefMousePos;
    int WheelingWindowStartFrame;
    float WheelingWindowReleaseTimer = 0.0f;
    ImVec2 WheelingWindowWheelRemainder;
    ImVec2 WheelingAxisAvg;
    ImGuiID DebugHookIdInfo;
    ImGuiID HoveredId;
    ImGuiID HoveredIdPreviousFrame;
    bool HoveredIdAllowOverlap;
    bool HoveredIdDisabled;
    float HoveredIdTimer = 0.0f;
    float HoveredIdNotActiveTimer = 0.0f;
    ImGuiID ActiveId;
    ImGuiID ActiveIdIsAlive;
    float ActiveIdTimer = 0.0f;
    bool ActiveIdIsJustActivated;
    bool ActiveIdAllowOverlap;
    bool ActiveIdNoClearOnFocusLoss;
    bool ActiveIdHasBeenPressedBefore;
    bool ActiveIdHasBeenEditedBefore;
    bool ActiveIdHasBeenEditedThisFrame;
    ImVec2 ActiveIdClickOffset;
    ImGuiWindow* ActiveIdWindow;
    ImGuiInputSource ActiveIdSource;
    int ActiveIdMouseButton;
    ImGuiID ActiveIdPreviousFrame;
    bool ActiveIdPreviousFrameIsAlive;
    bool ActiveIdPreviousFrameHasBeenEditedBefore;
    ImGuiWindow* ActiveIdPreviousFrameWindow;
    ImGuiID LastActiveId;
    float LastActiveIdTimer = 0.0f;
    ImGuiKeyOwnerData[ImGuiKey.ImGuiKey_NamedKey_COUNT] KeysOwnerData;
    ImGuiKeyRoutingTable KeysRoutingTable;
    ImU32 ActiveIdUsingNavDirMask;
    bool ActiveIdUsingAllKeyboardKeys;
    ImU32 ActiveIdUsingNavInputMask;
    ImGuiID CurrentFocusScopeId;
    ImGuiItemFlags CurrentItemFlags;
    ImGuiID DebugLocateId;
    ImGuiNextItemData NextItemData;
    ImGuiLastItemData LastItemData;
    ImGuiNextWindowData NextWindowData;
    ImVector_ImGuiColorMod ColorStack;
    ImVector_ImGuiStyleMod StyleVarStack;
    ImVector_ImFontPtr FontStack;
    ImVector_ImGuiID FocusScopeStack;
    ImVector_ImGuiItemFlags ItemFlagsStack;
    ImVector_ImGuiGroupData GroupStack;
    ImVector_ImGuiPopupData OpenPopupStack;
    ImVector_ImGuiPopupData BeginPopupStack;
    ImVector_ImGuiNavTreeNodeData NavTreeNodeStack;
    int BeginMenuCount;
    ImVector_ImGuiViewportPPtr Viewports;
    ImGuiWindow* NavWindow;
    ImGuiID NavId;
    ImGuiID NavFocusScopeId;
    ImGuiID NavActivateId;
    ImGuiID NavActivateDownId;
    ImGuiID NavActivatePressedId;
    ImGuiActivateFlags NavActivateFlags;
    ImGuiID NavJustMovedToId;
    ImGuiID NavJustMovedToFocusScopeId;
    ImGuiKeyChord NavJustMovedToKeyMods;
    ImGuiID NavNextActivateId;
    ImGuiActivateFlags NavNextActivateFlags;
    ImGuiInputSource NavInputSource;
    ImGuiNavLayer NavLayer;
    bool NavIdIsAlive;
    bool NavMousePosDirty;
    bool NavDisableHighlight;
    bool NavDisableMouseHover;
    bool NavAnyRequest;
    bool NavInitRequest;
    bool NavInitRequestFromMove;
    ImGuiNavItemData NavInitResult;
    bool NavMoveSubmitted;
    bool NavMoveScoringItems;
    bool NavMoveForwardToNextFrame;
    ImGuiNavMoveFlags NavMoveFlags;
    ImGuiScrollFlags NavMoveScrollFlags;
    ImGuiKeyChord NavMoveKeyMods;
    ImGuiDir NavMoveDir;
    ImGuiDir NavMoveDirForDebug;
    ImGuiDir NavMoveClipDir;
    ImRect NavScoringRect;
    ImRect NavScoringNoClipRect;
    int NavScoringDebugCount;
    int NavTabbingDir;
    int NavTabbingCounter;
    ImGuiNavItemData NavMoveResultLocal;
    ImGuiNavItemData NavMoveResultLocalVisible;
    ImGuiNavItemData NavMoveResultOther;
    ImGuiNavItemData NavTabbingResultFirst;
    ImGuiKeyChord ConfigNavWindowingKeyNext;
    ImGuiKeyChord ConfigNavWindowingKeyPrev;
    ImGuiWindow* NavWindowingTarget;
    ImGuiWindow* NavWindowingTargetAnim;
    ImGuiWindow* NavWindowingListWindow;
    float NavWindowingTimer = 0.0f;
    float NavWindowingHighlightAlpha = 0.0f;
    bool NavWindowingToggleLayer;
    ImVec2 NavWindowingAccumDeltaPos;
    ImVec2 NavWindowingAccumDeltaSize;
    float DimBgRatio = 0.0f;
    bool DragDropActive;
    bool DragDropWithinSource;
    bool DragDropWithinTarget;
    ImGuiDragDropFlags DragDropSourceFlags;
    int DragDropSourceFrameCount;
    int DragDropMouseButton;
    ImGuiPayload DragDropPayload;
    ImRect DragDropTargetRect;
    ImGuiID DragDropTargetId;
    ImGuiDragDropFlags DragDropAcceptFlags;
    float DragDropAcceptIdCurrRectSurface = 0.0f;
    ImGuiID DragDropAcceptIdCurr;
    ImGuiID DragDropAcceptIdPrev;
    int DragDropAcceptFrameCount;
    ImGuiID DragDropHoldJustPressedId;
    ImVector_unsigned_char DragDropPayloadBufHeap;
    ubyte[16] DragDropPayloadBufLocal;
    int ClipperTempDataStacked;
    ImVector_ImGuiListClipperData ClipperTempData;
    ImGuiTable* CurrentTable;
    int TablesTempDataStacked;
    ImVector_ImGuiTableTempData TablesTempData;
    ImPool_ImGuiTable Tables;
    ImVector_float TablesLastTimeActive;
    ImVector_ImDrawChannel DrawChannelsTempMergeBuffer;
    ImGuiTabBar* CurrentTabBar;
    ImPool_ImGuiTabBar TabBars;
    ImVector_ImGuiPtrOrIndex CurrentTabBarStack;
    ImVector_ImGuiShrinkWidthItem ShrinkWidthBuffer;
    ImGuiID HoverItemDelayId;
    ImGuiID HoverItemDelayIdPreviousFrame;
    float HoverItemDelayTimer = 0.0f;
    float HoverItemDelayClearTimer = 0.0f;
    ImGuiID HoverItemUnlockedStationaryId;
    ImGuiID HoverWindowUnlockedStationaryId;
    ImGuiMouseCursor MouseCursor;
    float MouseStationaryTimer = 0.0f;
    ImVec2 MouseLastValidPos;
    ImGuiInputTextState InputTextState;
    ImGuiInputTextDeactivatedState InputTextDeactivatedState;
    ImFont InputTextPasswordFont;
    ImGuiID TempInputId;
    ImGuiColorEditFlags ColorEditOptions;
    ImGuiID ColorEditCurrentID;
    ImGuiID ColorEditSavedID;
    float ColorEditSavedHue = 0.0f;
    float ColorEditSavedSat = 0.0f;
    ImU32 ColorEditSavedColor;
    ImVec4 ColorPickerRef;
    ImGuiComboPreviewData ComboPreviewData;
    float SliderGrabClickOffset = 0.0f;
    float SliderCurrentAccum = 0.0f;
    bool SliderCurrentAccumDirty;
    bool DragCurrentAccumDirty;
    float DragCurrentAccum = 0.0f;
    float DragSpeedDefaultRatio = 0.0f;
    float ScrollbarClickDeltaToGrabCenter = 0.0f;
    float DisabledAlphaBackup = 0.0f;
    short DisabledStackSize;
    short LockMarkEdited;
    short TooltipOverrideCount;
    ImVector_char ClipboardHandlerData;
    ImVector_ImGuiID MenusIdSubmittedThisFrame;
    ImGuiPlatformImeData PlatformImeData;
    ImGuiPlatformImeData PlatformImeDataPrev;
    bool SettingsLoaded;
    float SettingsDirtyTimer = 0.0f;
    ImGuiTextBuffer SettingsIniData;
    ImVector_ImGuiSettingsHandler SettingsHandlers;
    ImChunkStream_ImGuiWindowSettings SettingsWindows;
    ImChunkStream_ImGuiTableSettings SettingsTables;
    ImVector_ImGuiContextHook Hooks;
    ImGuiID HookIdNext;
    const(char)*[ImGuiLocKey.ImGuiLocKey_COUNT] LocalizationTable;
    bool LogEnabled;
    ImGuiLogType LogType;
    ImFileHandle LogFile;
    ImGuiTextBuffer LogBuffer;
    const(char)* LogNextPrefix;
    const(char)* LogNextSuffix;
    float LogLinePosY = 0.0f;
    bool LogLineFirstItem;
    int LogDepthRef;
    int LogDepthToExpand;
    int LogDepthToExpandDefault;
    ImGuiDebugLogFlags DebugLogFlags;
    ImGuiTextBuffer DebugLogBuf;
    ImGuiTextIndex DebugLogIndex;
    ImU8 DebugLogClipperAutoDisableFrames;
    ImU8 DebugLocateFrames;
    ImS8 DebugBeginReturnValueCullDepth;
    bool DebugItemPickerActive;
    ImU8 DebugItemPickerMouseButton;
    ImGuiID DebugItemPickerBreakId;
    ImGuiMetricsConfig DebugMetricsConfig;
    ImGuiStackTool DebugStackTool;
    float[60] FramerateSecPerFrame;
    int FramerateSecPerFrameIdx;
    int FramerateSecPerFrameCount;
    float FramerateSecPerFrameAccum = 0.0f;
    int WantCaptureMouseNextFrame;
    int WantCaptureKeyboardNextFrame;
    int WantTextInputNextFrame;
    ImVector_char TempBuffer;
}

struct ImGuiWindowTempData
{
    ImVec2 CursorPos;
    ImVec2 CursorPosPrevLine;
    ImVec2 CursorStartPos;
    ImVec2 CursorMaxPos;
    ImVec2 IdealMaxPos;
    ImVec2 CurrLineSize;
    ImVec2 PrevLineSize;
    float CurrLineTextBaseOffset = 0.0f;
    float PrevLineTextBaseOffset = 0.0f;
    bool IsSameLine;
    bool IsSetPos;
    ImVec1 Indent;
    ImVec1 ColumnsOffset;
    ImVec1 GroupOffset;
    ImVec2 CursorStartPosLossyness;
    ImGuiNavLayer NavLayerCurrent;
    short NavLayersActiveMask;
    short NavLayersActiveMaskNext;
    bool NavIsScrollPushableX;
    bool NavHideHighlightOneFrame;
    bool NavWindowHasScrollY;
    bool MenuBarAppending;
    ImVec2 MenuBarOffset;
    ImGuiMenuColumns MenuColumns;
    int TreeDepth;
    ImU32 TreeJumpToParentOnPopMask;
    ImVector_ImGuiWindowPtr ChildWindows;
    ImGuiStorage* StateStorage;
    ImGuiOldColumns* CurrentColumns;
    int CurrentTableIdx;
    ImGuiLayoutType LayoutType;
    ImGuiLayoutType ParentLayoutType;
    float ItemWidth = 0.0f;
    float TextWrapPos = 0.0f;
    ImVector_float ItemWidthStack;
    ImVector_float TextWrapPosStack;
}

struct ImVector_ImGuiOldColumns
{
    int Size;
    int Capacity;
    ImGuiOldColumns* Data;
}

struct ImGuiWindow
{
    import std.bitmanip : bitfields;

    ImGuiContext* Ctx;
    char* Name;
    ImGuiID ID;
    ImGuiWindowFlags Flags;
    ImGuiViewportP* Viewport;
    ImVec2 Pos;
    ImVec2 Size;
    ImVec2 SizeFull;
    ImVec2 ContentSize;
    ImVec2 ContentSizeIdeal;
    ImVec2 ContentSizeExplicit;
    ImVec2 WindowPadding;
    float WindowRounding = 0.0f;
    float WindowBorderSize = 0.0f;
    float DecoOuterSizeX1 = 0.0f;
    float DecoOuterSizeY1 = 0.0f;
    float DecoOuterSizeX2 = 0.0f;
    float DecoOuterSizeY2 = 0.0f;
    float DecoInnerSizeX1 = 0.0f;
    float DecoInnerSizeY1 = 0.0f;
    int NameBufLen;
    ImGuiID MoveId;
    ImGuiID ChildId;
    ImVec2 Scroll;
    ImVec2 ScrollMax;
    ImVec2 ScrollTarget;
    ImVec2 ScrollTargetCenterRatio;
    ImVec2 ScrollTargetEdgeSnapDist;
    ImVec2 ScrollbarSizes;
    bool ScrollbarX;
    bool ScrollbarY;
    bool Active;
    bool WasActive;
    bool WriteAccessed;
    bool Collapsed;
    bool WantCollapseToggle;
    bool SkipItems;
    bool Appearing;
    bool Hidden;
    bool IsFallbackWindow;
    bool IsExplicitChild;
    bool HasCloseButton;
    byte ResizeBorderHeld;
    short BeginCount;
    short BeginCountPreviousFrame;
    short BeginOrderWithinParent;
    short BeginOrderWithinContext;
    short FocusOrder;
    ImGuiID PopupId;
    ImS8 AutoFitFramesX;
    ImS8 AutoFitFramesY;
    ImS8 AutoFitChildAxises;
    bool AutoFitOnlyGrows;
    ImGuiDir AutoPosLastDirection;
    ImS8 HiddenFramesCanSkipItems;
    ImS8 HiddenFramesCannotSkipItems;
    ImS8 HiddenFramesForRenderOnly;
    ImS8 DisableInputsFrames;

    mixin(bitfields!(ImGuiCond, "SetWindowPosAllowFlags", 8, ImGuiCond,
            "SetWindowSizeAllowFlags", 8, ImGuiCond,
            "SetWindowCollapsedAllowFlags", 8, uint, "", 8));

    ImVec2 SetWindowPosVal;
    ImVec2 SetWindowPosPivot;
    ImVector_ImGuiID IDStack;
    ImGuiWindowTempData DC;
    ImRect OuterRectClipped;
    ImRect InnerRect;
    ImRect InnerClipRect;
    ImRect WorkRect;
    ImRect ParentWorkRect;
    ImRect ClipRect;
    ImRect ContentRegionRect;
    ImVec2ih HitTestHoleSize;
    ImVec2ih HitTestHoleOffset;
    int LastFrameActive;
    float LastTimeActive = 0.0f;
    float ItemWidthDefault = 0.0f;
    ImGuiStorage StateStorage;
    ImVector_ImGuiOldColumns ColumnsStorage;
    float FontWindowScale = 0.0f;
    int SettingsOffset;
    ImDrawList* DrawList;
    ImDrawList DrawListInst;
    ImGuiWindow* ParentWindow;
    ImGuiWindow* ParentWindowInBeginStack;
    ImGuiWindow* RootWindow;
    ImGuiWindow* RootWindowPopupTree;
    ImGuiWindow* RootWindowForTitleBarHighlight;
    ImGuiWindow* RootWindowForNav;
    ImGuiWindow* NavLastChildNavWindow;
    ImGuiID[ImGuiNavLayer.ImGuiNavLayer_COUNT] NavLastIds;
    ImRect[ImGuiNavLayer.ImGuiNavLayer_COUNT] NavRectRel;
    ImVec2[ImGuiNavLayer.ImGuiNavLayer_COUNT] NavPreferredScoringPosRel;
    ImGuiID NavRootFocusScopeId;
    int MemoryDrawListIdxCapacity;
    int MemoryDrawListVtxCapacity;
    bool MemoryCompacted;
}

enum ImGuiTabBarFlagsPrivate_
{
    ImGuiTabBarFlags_DockNode = 1 << 20,
    ImGuiTabBarFlags_IsFocused = 1 << 21,
    ImGuiTabBarFlags_SaveSettings = 1 << 22
}

// enum ImGuiTabItemFlagsPrivate_
// {
//     ImGuiTabItemFlags_SectionMask_ = ImGuiTabItemFlags_.ImGuiTabItemFlags_Leading
//         | ImGuiTabItemFlags_.ImGuiTabItemFlags_Trailing,
//     ImGuiTabItemFlags_NoCloseButton = 1 << 20,
//     ImGuiTabItemFlags_Button = 1 << 21
// }

struct ImGuiTabItem
{
    ImGuiID ID;
    ImGuiTabItemFlags Flags;
    int LastFrameVisible;
    int LastFrameSelected;
    float Offset = 0.0f;
    float Width = 0.0f;
    float ContentWidth = 0.0f;
    float RequestedWidth = 0.0f;
    ImS32 NameOffset;
    ImS16 BeginOrder;
    ImS16 IndexDuringLayout;
    bool WantClose;
}

struct ImVector_ImGuiTabItem
{
    int Size;
    int Capacity;
    ImGuiTabItem* Data;
}

struct ImGuiTabBar
{
    ImVector_ImGuiTabItem Tabs;
    ImGuiTabBarFlags Flags;
    ImGuiID ID;
    ImGuiID SelectedTabId;
    ImGuiID NextSelectedTabId;
    ImGuiID VisibleTabId;
    int CurrFrameVisible;
    int PrevFrameVisible;
    ImRect BarRect;
    float CurrTabsContentsHeight = 0.0f;
    float PrevTabsContentsHeight = 0.0f;
    float WidthAllTabs = 0.0f;
    float WidthAllTabsIdeal = 0.0f;
    float ScrollingAnim = 0.0f;
    float ScrollingTarget = 0.0f;
    float ScrollingTargetDistToVisibility = 0.0f;
    float ScrollingSpeed = 0.0f;
    float ScrollingRectMinX = 0.0f;
    float ScrollingRectMaxX = 0.0f;
    ImGuiID ReorderRequestTabId;
    ImS16 ReorderRequestOffset;
    ImS8 BeginCount;
    bool WantLayout;
    bool VisibleTabWasSubmitted;
    bool TabsAddedNew;
    ImS16 TabsActiveCount;
    ImS16 LastTabItemIdx;
    float ItemSpacingY = 0.0f;
    ImVec2 FramePadding;
    ImVec2 BackupCursorPos;
    ImGuiTextBuffer TabsNames;
}

alias ImGuiTableColumnIdx = short;
alias ImGuiTableDrawChannelIdx = ushort;

struct ImGuiTableColumn
{
    import std.bitmanip : bitfields;

    ImGuiTableColumnFlags Flags;
    float WidthGiven;
    float MinX;
    float MaxX;
    float WidthRequest;
    float WidthAuto;
    float StretchWeight;
    float InitStretchWeightOrWidth;
    ImRect ClipRect;
    ImGuiID UserID;
    float WorkMinX;
    float WorkMaxX;
    float ItemWidth;
    float ContentMaxXFrozen;
    float ContentMaxXUnfrozen;
    float ContentMaxXHeadersUsed;
    float ContentMaxXHeadersIdeal;
    ImS16 NameOffset;
    ImGuiTableColumnIdx DisplayOrder;
    ImGuiTableColumnIdx IndexWithinEnabledSet;
    ImGuiTableColumnIdx PrevEnabledColumn;
    ImGuiTableColumnIdx NextEnabledColumn;
    ImGuiTableColumnIdx SortOrder;
    ImGuiTableDrawChannelIdx DrawChannelCurrent;
    ImGuiTableDrawChannelIdx DrawChannelFrozen;
    ImGuiTableDrawChannelIdx DrawChannelUnfrozen;
    bool IsEnabled;
    bool IsUserEnabled;
    bool IsUserEnabledNextFrame;
    bool IsVisibleX;
    bool IsVisibleY;
    bool IsRequestOutput;
    bool IsSkipItems;
    bool IsPreserveWidthAuto;
    ImS8 NavLayerCurrent;
    ImU8 AutoFitQueue;
    ImU8 CannotSkipItemsQueue;

    mixin(bitfields!(ImU8, "SortDirection", 2, ImU8,
            "SortDirectionsAvailCount", 2, ImU8, "SortDirectionsAvailMask", 4));

    ImU8 SortDirectionsAvailList;
}

struct ImGuiTableCellData
{
    ImU32 BgColor;
    ImGuiTableColumnIdx Column;
}

struct ImGuiTableInstanceData
{
    ImGuiID TableInstanceID;
    float LastOuterHeight;
    float LastFirstRowHeight;
    float LastFrozenHeight;
    int HoveredRowLast;
    int HoveredRowNext;
}

struct ImSpan_ImGuiTableColumn
{
    ImGuiTableColumn* Data;
    ImGuiTableColumn* DataEnd;
}

struct ImSpan_ImGuiTableColumnIdx
{
    ImGuiTableColumnIdx* Data;
    ImGuiTableColumnIdx* DataEnd;
}

struct ImSpan_ImGuiTableCellData
{
    ImGuiTableCellData* Data;
    ImGuiTableCellData* DataEnd;
}

struct ImVector_ImGuiTableInstanceData
{
    int Size;
    int Capacity;
    ImGuiTableInstanceData* Data;
}

struct ImVector_ImGuiTableColumnSortSpecs
{
    int Size;
    int Capacity;
    ImGuiTableColumnSortSpecs* Data;
}

struct ImGuiTable
{
    import std.bitmanip : bitfields;

    ImGuiID ID;
    ImGuiTableFlags Flags;
    void* RawData;
    ImGuiTableTempData* TempData;
    ImSpan_ImGuiTableColumn Columns;
    ImSpan_ImGuiTableColumnIdx DisplayOrderToIndex;
    ImSpan_ImGuiTableCellData RowCellData;
    ImBitArrayPtr EnabledMaskByDisplayOrder;
    ImBitArrayPtr EnabledMaskByIndex;
    ImBitArrayPtr VisibleMaskByIndex;
    ImGuiTableFlags SettingsLoadedFlags;
    int SettingsOffset;
    int LastFrameActive;
    int ColumnsCount;
    int CurrentRow;
    int CurrentColumn;
    ImS16 InstanceCurrent;
    ImS16 InstanceInteracted;
    float RowPosY1;
    float RowPosY2;
    float RowMinHeight;
    float RowCellPaddingY;
    float RowTextBaseline;
    float RowIndentOffsetX;

    mixin(bitfields!(ImGuiTableRowFlags, "RowFlags", 16, ImGuiTableRowFlags, "LastRowFlags", 16));

    int RowBgColorCounter;
    ImU32[2] RowBgColor;
    ImU32 BorderColorStrong;
    ImU32 BorderColorLight;
    float BorderX1;
    float BorderX2;
    float HostIndentX;
    float MinColumnWidth;
    float OuterPaddingX;
    float CellPaddingX;
    float CellSpacingX1;
    float CellSpacingX2;
    float InnerWidth;
    float ColumnsGivenWidth;
    float ColumnsAutoFitWidth;
    float ColumnsStretchSumWeights;
    float ResizedColumnNextWidth;
    float ResizeLockMinContentsX2;
    float RefScale;
    ImRect OuterRect;
    ImRect InnerRect;
    ImRect WorkRect;
    ImRect InnerClipRect;
    ImRect BgClipRect;
    ImRect Bg0ClipRectForDrawCmd;
    ImRect Bg2ClipRectForDrawCmd;
    ImRect HostClipRect;
    ImRect HostBackupInnerClipRect;
    ImGuiWindow* OuterWindow;
    ImGuiWindow* InnerWindow;
    ImGuiTextBuffer ColumnsNames;
    ImDrawListSplitter* DrawSplitter;
    ImGuiTableInstanceData InstanceDataFirst;
    ImVector_ImGuiTableInstanceData InstanceDataExtra;
    ImGuiTableColumnSortSpecs SortSpecsSingle;
    ImVector_ImGuiTableColumnSortSpecs SortSpecsMulti;
    ImGuiTableSortSpecs SortSpecs;
    ImGuiTableColumnIdx SortSpecsCount;
    ImGuiTableColumnIdx ColumnsEnabledCount;
    ImGuiTableColumnIdx ColumnsEnabledFixedCount;
    ImGuiTableColumnIdx DeclColumnsCount;
    ImGuiTableColumnIdx HoveredColumnBody;
    ImGuiTableColumnIdx HoveredColumnBorder;
    ImGuiTableColumnIdx AutoFitSingleColumn;
    ImGuiTableColumnIdx ResizedColumn;
    ImGuiTableColumnIdx LastResizedColumn;
    ImGuiTableColumnIdx HeldHeaderColumn;
    ImGuiTableColumnIdx ReorderColumn;
    ImGuiTableColumnIdx ReorderColumnDir;
    ImGuiTableColumnIdx LeftMostEnabledColumn;
    ImGuiTableColumnIdx RightMostEnabledColumn;
    ImGuiTableColumnIdx LeftMostStretchedColumn;
    ImGuiTableColumnIdx RightMostStretchedColumn;
    ImGuiTableColumnIdx ContextPopupColumn;
    ImGuiTableColumnIdx FreezeRowsRequest;
    ImGuiTableColumnIdx FreezeRowsCount;
    ImGuiTableColumnIdx FreezeColumnsRequest;
    ImGuiTableColumnIdx FreezeColumnsCount;
    ImGuiTableColumnIdx RowCellDataCurrent;
    ImGuiTableDrawChannelIdx DummyDrawChannel;
    ImGuiTableDrawChannelIdx Bg2DrawChannelCurrent;
    ImGuiTableDrawChannelIdx Bg2DrawChannelUnfrozen;
    bool IsLayoutLocked;
    bool IsInsideRow;
    bool IsInitializing;
    bool IsSortSpecsDirty;
    bool IsUsingHeaders;
    bool IsContextPopupOpen;
    bool IsSettingsRequestLoad;
    bool IsSettingsDirty;
    bool IsDefaultDisplayOrder;
    bool IsResetAllRequest;
    bool IsResetDisplayOrderRequest;
    bool IsUnfrozenRows;
    bool IsDefaultSizingPolicy;
    bool HasScrollbarYCurr;
    bool HasScrollbarYPrev;
    bool MemoryCompacted;
    bool HostSkipItems;
}

struct ImGuiTableTempData
{
    int TableIndex;
    float LastTimeActive;
    ImVec2 UserOuterSize;
    ImDrawListSplitter DrawSplitter;
    ImRect HostBackupWorkRect;
    ImRect HostBackupParentWorkRect;
    ImVec2 HostBackupPrevLineSize;
    ImVec2 HostBackupCurrLineSize;
    ImVec2 HostBackupCursorMaxPos;
    ImVec1 HostBackupColumnsOffset;
    float HostBackupItemWidth;
    int HostBackupItemWidthStackSize;
}

struct ImGuiTableColumnSettings
{
    import std.bitmanip : bitfields;

    float WidthOrWeight;
    ImGuiID UserID;
    ImGuiTableColumnIdx Index;
    ImGuiTableColumnIdx DisplayOrder;
    ImGuiTableColumnIdx SortOrder;

    mixin(bitfields!(ImU8, "SortDirection", 2, ImU8, "IsEnabled", 1, ImU8,
            "IsStretch", 1, uint, "", 4));
}

struct ImGuiTableSettings
{
    ImGuiID ID;
    ImGuiTableFlags SaveFlags;
    float RefScale;
    ImGuiTableColumnIdx ColumnsCount;
    ImGuiTableColumnIdx ColumnsCountMax;
    bool WantApply;
}

struct ImFontBuilderIO
{
    bool function(ImFontAtlas* atlas) FontBuilder_Build;
}

ImVec2* ImVec2_ImVec2_Nil();
void ImVec2_destroy(ImVec2* self);
ImVec2* ImVec2_ImVec2_Float(float _x, float _y);
ImVec4* ImVec4_ImVec4_Nil();
void ImVec4_destroy(ImVec4* self);
ImVec4* ImVec4_ImVec4_Float(float _x, float _y, float _z, float _w);
ImGuiContext* igCreateContext(ImFontAtlas* shared_font_atlas);
void igDestroyContext(ImGuiContext* ctx);
ImGuiContext* igGetCurrentContext();
void igSetCurrentContext(ImGuiContext* ctx);
ImGuiIO* igGetIO();
ImGuiStyle* igGetStyle();
void igNewFrame();
void igEndFrame();
void igRender();
ImDrawData* igGetDrawData();
void igShowDemoWindow(bool* p_open);
void igShowMetricsWindow(bool* p_open);
void igShowDebugLogWindow(bool* p_open);
void igShowStackToolWindow(bool* p_open);
void igShowAboutWindow(bool* p_open);
void igShowStyleEditor(ImGuiStyle* ref_);
bool igShowStyleSelector(const(char)* label);
void igShowFontSelector(const(char)* label);
void igShowUserGuide();
const(char)* igGetVersion();
void igStyleColorsDark(ImGuiStyle* dst);
void igStyleColorsLight(ImGuiStyle* dst);
void igStyleColorsClassic(ImGuiStyle* dst);
bool igBegin(const(char)* name, bool* p_open, ImGuiWindowFlags flags);
void igEnd();
bool igBeginChild_Str(const(char)* str_id, const ImVec2 size, bool border, ImGuiWindowFlags flags);
bool igBeginChild_ID(ImGuiID id, const ImVec2 size, bool border, ImGuiWindowFlags flags);
void igEndChild();
bool igIsWindowAppearing();
bool igIsWindowCollapsed();
bool igIsWindowFocused(ImGuiFocusedFlags flags);
bool igIsWindowHovered(ImGuiHoveredFlags flags);
ImDrawList* igGetWindowDrawList();
void igGetWindowPos(ImVec2* pOut);
void igGetWindowSize(ImVec2* pOut);
float igGetWindowWidth();
float igGetWindowHeight();
void igSetNextWindowPos(const ImVec2 pos, ImGuiCond cond, const ImVec2 pivot);
void igSetNextWindowSize(const ImVec2 size, ImGuiCond cond);
void igSetNextWindowSizeConstraints(const ImVec2 size_min, const ImVec2 size_max,
        ImGuiSizeCallback custom_callback, void* custom_callback_data);
void igSetNextWindowContentSize(const ImVec2 size);
void igSetNextWindowCollapsed(bool collapsed, ImGuiCond cond);
void igSetNextWindowFocus();
void igSetNextWindowScroll(const ImVec2 scroll);
void igSetNextWindowBgAlpha(float alpha);
void igSetWindowPos_Vec2(const ImVec2 pos, ImGuiCond cond);
void igSetWindowSize_Vec2(const ImVec2 size, ImGuiCond cond);
void igSetWindowCollapsed_Bool(bool collapsed, ImGuiCond cond);
void igSetWindowFocus_Nil();
void igSetWindowFontScale(float scale);
void igSetWindowPos_Str(const(char)* name, const ImVec2 pos, ImGuiCond cond);
void igSetWindowSize_Str(const(char)* name, const ImVec2 size, ImGuiCond cond);
void igSetWindowCollapsed_Str(const(char)* name, bool collapsed, ImGuiCond cond);
void igSetWindowFocus_Str(const(char)* name);
void igGetContentRegionAvail(ImVec2* pOut);
void igGetContentRegionMax(ImVec2* pOut);
void igGetWindowContentRegionMin(ImVec2* pOut);
void igGetWindowContentRegionMax(ImVec2* pOut);
float igGetScrollX();
float igGetScrollY();
void igSetScrollX_Float(float scroll_x);
void igSetScrollY_Float(float scroll_y);
float igGetScrollMaxX();
float igGetScrollMaxY();
void igSetScrollHereX(float center_x_ratio);
void igSetScrollHereY(float center_y_ratio);
void igSetScrollFromPosX_Float(float local_x, float center_x_ratio);
void igSetScrollFromPosY_Float(float local_y, float center_y_ratio);
void igPushFont(ImFont* font);
void igPopFont();
void igPushStyleColor_U32(ImGuiCol idx, ImU32 col);
void igPushStyleColor_Vec4(ImGuiCol idx, const ImVec4 col);
void igPopStyleColor(int count);
void igPushStyleVar_Float(ImGuiStyleVar idx, float val);
void igPushStyleVar_Vec2(ImGuiStyleVar idx, const ImVec2 val);
void igPopStyleVar(int count);
void igPushTabStop(bool tab_stop);
void igPopTabStop();
void igPushButtonRepeat(bool repeat);
void igPopButtonRepeat();
void igPushItemWidth(float item_width);
void igPopItemWidth();
void igSetNextItemWidth(float item_width);
float igCalcItemWidth();
void igPushTextWrapPos(float wrap_local_pos_x);
void igPopTextWrapPos();
ImFont* igGetFont();
float igGetFontSize();
void igGetFontTexUvWhitePixel(ImVec2* pOut);
ImU32 igGetColorU32_Col(ImGuiCol idx, float alpha_mul);
ImU32 igGetColorU32_Vec4(const ImVec4 col);
ImU32 igGetColorU32_U32(ImU32 col);
const(ImVec4)* igGetStyleColorVec4(ImGuiCol idx);
void igSeparator();
void igSameLine(float offset_from_start_x, float spacing);
void igNewLine();
void igSpacing();
void igDummy(const ImVec2 size);
void igIndent(float indent_w);
void igUnindent(float indent_w);
void igBeginGroup();
void igEndGroup();
void igGetCursorPos(ImVec2* pOut);
float igGetCursorPosX();
float igGetCursorPosY();
void igSetCursorPos(const ImVec2 local_pos);
void igSetCursorPosX(float local_x);
void igSetCursorPosY(float local_y);
void igGetCursorStartPos(ImVec2* pOut);
void igGetCursorScreenPos(ImVec2* pOut);
void igSetCursorScreenPos(const ImVec2 pos);
void igAlignTextToFramePadding();
float igGetTextLineHeight();
float igGetTextLineHeightWithSpacing();
float igGetFrameHeight();
float igGetFrameHeightWithSpacing();
void igPushID_Str(const(char)* str_id);
void igPushID_StrStr(const(char)* str_id_begin, const(char)* str_id_end);
void igPushID_Ptr(const(void)* ptr_id);
void igPushID_Int(int int_id);
void igPopID();
ImGuiID igGetID_Str(const(char)* str_id);
ImGuiID igGetID_StrStr(const(char)* str_id_begin, const(char)* str_id_end);
ImGuiID igGetID_Ptr(const(void)* ptr_id);
void igTextUnformatted(const(char)* text, const(char)* text_end);
void igText(const(char)* fmt, ...);
void igTextV(const(char)* fmt, va_list args);
void igTextColored(const ImVec4 col, const(char)* fmt, ...);
void igTextColoredV(const ImVec4 col, const(char)* fmt, va_list args);
void igTextDisabled(const(char)* fmt, ...);
void igTextDisabledV(const(char)* fmt, va_list args);
void igTextWrapped(const(char)* fmt, ...);
void igTextWrappedV(const(char)* fmt, va_list args);
void igLabelText(const(char)* label, const(char)* fmt, ...);
void igLabelTextV(const(char)* label, const(char)* fmt, va_list args);
void igBulletText(const(char)* fmt, ...);
void igBulletTextV(const(char)* fmt, va_list args);
void igSeparatorText(const(char)* label);
bool igButton(const(char)* label, const ImVec2 size);
bool igSmallButton(const(char)* label);
bool igInvisibleButton(const(char)* str_id, const ImVec2 size, ImGuiButtonFlags flags);
bool igArrowButton(const(char)* str_id, ImGuiDir dir);
bool igCheckbox(const(char)* label, bool* v);
bool igCheckboxFlags_IntPtr(const(char)* label, int* flags, int flags_value);
bool igCheckboxFlags_UintPtr(const(char)* label, uint* flags, uint flags_value);
bool igRadioButton_Bool(const(char)* label, bool active);
bool igRadioButton_IntPtr(const(char)* label, int* v, int v_button);
void igProgressBar(float fraction, const ImVec2 size_arg, const(char)* overlay);
void igBullet();
void igImage(ImTextureID user_texture_id, const ImVec2 size, const ImVec2 uv0,
        const ImVec2 uv1, const ImVec4 tint_col, const ImVec4 border_col);
bool igImageButton(const(char)* str_id, ImTextureID user_texture_id, const ImVec2 size,
        const ImVec2 uv0, const ImVec2 uv1, const ImVec4 bg_col, const ImVec4 tint_col);
bool igBeginCombo(const(char)* label, const(char)* preview_value, ImGuiComboFlags flags);
void igEndCombo();
bool igCombo_Str_arr(const(char)* label, int* current_item,
        const(char*)* items, int items_count, int popup_max_height_in_items);
bool igCombo_Str(const(char)* label, int* current_item,
        const(char)* items_separated_by_zeros, int popup_max_height_in_items);
bool igCombo_FnBoolPtr(const(char)* label, int* current_item,
        bool function(void* data, int idx, const(char*)* out_text) items_getter,
        void* data, int items_count, int popup_max_height_in_items);
bool igDragFloat(const(char)* label, float* v, float v_speed, float v_min,
        float v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragFloat2(const(char)* label, ref float[2] v, float v_speed, float v_min,
        float v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragFloat3(const(char)* label, ref float[3] v, float v_speed, float v_min,
        float v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragFloat4(const(char)* label, ref float[4] v, float v_speed, float v_min,
        float v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragFloatRange2(const(char)* label, float* v_current_min,
        float* v_current_max, float v_speed, float v_min, float v_max,
        const(char)* format, const(char)* format_max, ImGuiSliderFlags flags);
bool igDragInt(const(char)* label, int* v, float v_speed, int v_min, int v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igDragInt2(const(char)* label, ref int[2] v, float v_speed, int v_min,
        int v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragInt3(const(char)* label, ref int[3] v, float v_speed, int v_min,
        int v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragInt4(const(char)* label, ref int[4] v, float v_speed, int v_min,
        int v_max, const(char)* format, ImGuiSliderFlags flags);
bool igDragIntRange2(const(char)* label, int* v_current_min,
        int* v_current_max, float v_speed, int v_min, int v_max,
        const(char)* format, const(char)* format_max, ImGuiSliderFlags flags);
bool igDragScalar(const(char)* label, ImGuiDataType data_type, void* p_data,
        float v_speed, const(void)* p_min, const(void)* p_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igDragScalarN(const(char)* label, ImGuiDataType data_type, void* p_data,
        int components, float v_speed, const(void)* p_min, const(void)* p_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderFloat(const(char)* label, float* v, float v_min, float v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderFloat2(const(char)* label, ref float[2] v, float v_min, float v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderFloat3(const(char)* label, ref float[3] v, float v_min, float v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderFloat4(const(char)* label, ref float[4] v, float v_min, float v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderAngle(const(char)* label, float* v_rad, float v_degrees_min,
        float v_degrees_max, const(char)* format, ImGuiSliderFlags flags);
bool igSliderInt(const(char)* label, int* v, int v_min, int v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderInt2(const(char)* label, ref int[2] v, int v_min, int v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderInt3(const(char)* label, ref int[3] v, int v_min, int v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderInt4(const(char)* label, ref int[4] v, int v_min, int v_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igSliderScalar(const(char)* label, ImGuiDataType data_type, void* p_data,
        const(void)* p_min, const(void)* p_max, const(char)* format, ImGuiSliderFlags flags);
bool igSliderScalarN(const(char)* label, ImGuiDataType data_type, void* p_data,
        int components, const(void)* p_min, const(void)* p_max,
        const(char)* format, ImGuiSliderFlags flags);
bool igVSliderFloat(const(char)* label, const ImVec2 size, float* v, float v_min,
        float v_max, const(char)* format, ImGuiSliderFlags flags);
bool igVSliderInt(const(char)* label, const ImVec2 size, int* v, int v_min,
        int v_max, const(char)* format, ImGuiSliderFlags flags);
bool igVSliderScalar(const(char)* label, const ImVec2 size,
        ImGuiDataType data_type, void* p_data, const(void)* p_min,
        const(void)* p_max, const(char)* format, ImGuiSliderFlags flags);
bool igInputText(const(char)* label, char* buf, size_t buf_size,
        ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data);
bool igInputTextMultiline(const(char)* label, char* buf, size_t buf_size, const ImVec2 size,
        ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data);
bool igInputTextWithHint(const(char)* label, const(char)* hint, char* buf, size_t buf_size,
        ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data);
bool igInputFloat(const(char)* label, float* v, float step, float step_fast,
        const(char)* format, ImGuiInputTextFlags flags);
bool igInputFloat2(const(char)* label, ref float[2] v, const(char)* format,
        ImGuiInputTextFlags flags);
bool igInputFloat3(const(char)* label, ref float[3] v, const(char)* format,
        ImGuiInputTextFlags flags);
bool igInputFloat4(const(char)* label, ref float[4] v, const(char)* format,
        ImGuiInputTextFlags flags);
bool igInputInt(const(char)* label, int* v, int step, int step_fast, ImGuiInputTextFlags flags);
bool igInputInt2(const(char)* label, ref int[2] v, ImGuiInputTextFlags flags);
bool igInputInt3(const(char)* label, ref int[3] v, ImGuiInputTextFlags flags);
bool igInputInt4(const(char)* label, ref int[4] v, ImGuiInputTextFlags flags);
bool igInputDouble(const(char)* label, double* v, double step, double step_fast,
        const(char)* format, ImGuiInputTextFlags flags);
bool igInputScalar(const(char)* label, ImGuiDataType data_type, void* p_data,
        const(void)* p_step, const(void)* p_step_fast, const(char)* format,
        ImGuiInputTextFlags flags);
bool igInputScalarN(const(char)* label, ImGuiDataType data_type, void* p_data,
        int components, const(void)* p_step, const(void)* p_step_fast,
        const(char)* format, ImGuiInputTextFlags flags);
bool igColorEdit3(const(char)* label, ref float[3] col, ImGuiColorEditFlags flags);
bool igColorEdit4(const(char)* label, ref float[4] col, ImGuiColorEditFlags flags);
bool igColorPicker3(const(char)* label, ref float[3] col, ImGuiColorEditFlags flags);
bool igColorPicker4(const(char)* label, ref float[4] col,
        ImGuiColorEditFlags flags, const(float)* ref_col);
bool igColorButton(const(char)* desc_id, const ImVec4 col,
        ImGuiColorEditFlags flags, const ImVec2 size);
void igSetColorEditOptions(ImGuiColorEditFlags flags);
bool igTreeNode_Str(const(char)* label);
bool igTreeNode_StrStr(const(char)* str_id, const(char)* fmt, ...);
bool igTreeNode_Ptr(const(void)* ptr_id, const(char)* fmt, ...);
bool igTreeNodeV_Str(const(char)* str_id, const(char)* fmt, va_list args);
bool igTreeNodeV_Ptr(const(void)* ptr_id, const(char)* fmt, va_list args);
bool igTreeNodeEx_Str(const(char)* label, ImGuiTreeNodeFlags flags);
bool igTreeNodeEx_StrStr(const(char)* str_id, ImGuiTreeNodeFlags flags, const(char)* fmt, ...);
bool igTreeNodeEx_Ptr(const(void)* ptr_id, ImGuiTreeNodeFlags flags, const(char)* fmt, ...);
bool igTreeNodeExV_Str(const(char)* str_id, ImGuiTreeNodeFlags flags,
        const(char)* fmt, va_list args);
bool igTreeNodeExV_Ptr(const(void)* ptr_id, ImGuiTreeNodeFlags flags,
        const(char)* fmt, va_list args);
void igTreePush_Str(const(char)* str_id);
void igTreePush_Ptr(const(void)* ptr_id);
void igTreePop();
float igGetTreeNodeToLabelSpacing();
bool igCollapsingHeader_TreeNodeFlags(const(char)* label, ImGuiTreeNodeFlags flags);
bool igCollapsingHeader_BoolPtr(const(char)* label, bool* p_visible, ImGuiTreeNodeFlags flags);
void igSetNextItemOpen(bool is_open, ImGuiCond cond);
bool igSelectable_Bool(const(char)* label, bool selected,
        ImGuiSelectableFlags flags, const ImVec2 size);
bool igSelectable_BoolPtr(const(char)* label, bool* p_selected,
        ImGuiSelectableFlags flags, const ImVec2 size);
bool igBeginListBox(const(char)* label, const ImVec2 size);
void igEndListBox();
bool igListBox_Str_arr(const(char)* label, int* current_item,
        const(char*)* items, int items_count, int height_in_items);
bool igListBox_FnBoolPtr(const(char)* label, int* current_item,
        bool function(void* data, int idx, const(char*)* out_text) items_getter,
        void* data, int items_count, int height_in_items);
void igPlotLines_FloatPtr(const(char)* label, const(float)* values, int values_count,
        int values_offset, const(char)* overlay_text, float scale_min,
        float scale_max, ImVec2 graph_size, int stride);
void igPlotLines_FnFloatPtr(const(char)* label, float function(void* data,
        int idx) values_getter, void* data, int values_count, int values_offset,
        const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size);
void igPlotHistogram_FloatPtr(const(char)* label, const(float)* values,
        int values_count, int values_offset, const(char)* overlay_text,
        float scale_min, float scale_max, ImVec2 graph_size, int stride);
void igPlotHistogram_FnFloatPtr(const(char)* label, float function(void* data,
        int idx) values_getter, void* data, int values_count, int values_offset,
        const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size);
void igValue_Bool(const(char)* prefix, bool b);
void igValue_Int(const(char)* prefix, int v);
void igValue_Uint(const(char)* prefix, uint v);
void igValue_Float(const(char)* prefix, float v, const(char)* float_format);
bool igBeginMenuBar();
void igEndMenuBar();
bool igBeginMainMenuBar();
void igEndMainMenuBar();
bool igBeginMenu(const(char)* label, bool enabled);
void igEndMenu();
bool igMenuItem_Bool(const(char)* label, const(char)* shortcut, bool selected, bool enabled);
bool igMenuItem_BoolPtr(const(char)* label, const(char)* shortcut, bool* p_selected, bool enabled);
bool igBeginTooltip();
void igEndTooltip();
void igSetTooltip(const(char)* fmt, ...);
void igSetTooltipV(const(char)* fmt, va_list args);
bool igBeginItemTooltip();
void igSetItemTooltip(const(char)* fmt, ...);
void igSetItemTooltipV(const(char)* fmt, va_list args);
bool igBeginPopup(const(char)* str_id, ImGuiWindowFlags flags);
bool igBeginPopupModal(const(char)* name, bool* p_open, ImGuiWindowFlags flags);
void igEndPopup();
void igOpenPopup_Str(const(char)* str_id, ImGuiPopupFlags popup_flags);
void igOpenPopup_ID(ImGuiID id, ImGuiPopupFlags popup_flags);
void igOpenPopupOnItemClick(const(char)* str_id, ImGuiPopupFlags popup_flags);
void igCloseCurrentPopup();
bool igBeginPopupContextItem(const(char)* str_id, ImGuiPopupFlags popup_flags);
bool igBeginPopupContextWindow(const(char)* str_id, ImGuiPopupFlags popup_flags);
bool igBeginPopupContextVoid(const(char)* str_id, ImGuiPopupFlags popup_flags);
bool igIsPopupOpen_Str(const(char)* str_id, ImGuiPopupFlags flags);
bool igBeginTable(const(char)* str_id, int column, ImGuiTableFlags flags,
        const ImVec2 outer_size, float inner_width);
void igEndTable();
void igTableNextRow(ImGuiTableRowFlags row_flags, float min_row_height);
bool igTableNextColumn();
bool igTableSetColumnIndex(int column_n);
void igTableSetupColumn(const(char)* label, ImGuiTableColumnFlags flags,
        float init_width_or_weight, ImGuiID user_id);
void igTableSetupScrollFreeze(int cols, int rows);
void igTableHeadersRow();
void igTableHeader(const(char)* label);
ImGuiTableSortSpecs* igTableGetSortSpecs();
int igTableGetColumnCount();
int igTableGetColumnIndex();
int igTableGetRowIndex();
const(char)* igTableGetColumnName_Int(int column_n);
ImGuiTableColumnFlags igTableGetColumnFlags(int column_n);
void igTableSetColumnEnabled(int column_n, bool v);
void igTableSetBgColor(ImGuiTableBgTarget target, ImU32 color, int column_n);
void igColumns(int count, const(char)* id, bool border);
void igNextColumn();
int igGetColumnIndex();
float igGetColumnWidth(int column_index);
void igSetColumnWidth(int column_index, float width);
float igGetColumnOffset(int column_index);
void igSetColumnOffset(int column_index, float offset_x);
int igGetColumnsCount();
bool igBeginTabBar(const(char)* str_id, ImGuiTabBarFlags flags);
void igEndTabBar();
bool igBeginTabItem(const(char)* label, bool* p_open, ImGuiTabItemFlags flags);
void igEndTabItem();
bool igTabItemButton(const(char)* label, ImGuiTabItemFlags flags);
void igSetTabItemClosed(const(char)* tab_or_docked_window_label);
void igLogToTTY(int auto_open_depth);
void igLogToFile(int auto_open_depth, const(char)* filename);
void igLogToClipboard(int auto_open_depth);
void igLogFinish();
void igLogButtons();
void igLogTextV(const(char)* fmt, va_list args);
bool igBeginDragDropSource(ImGuiDragDropFlags flags);
bool igSetDragDropPayload(const(char)* type, const(void)* data, size_t sz, ImGuiCond cond);
void igEndDragDropSource();
bool igBeginDragDropTarget();
const(ImGuiPayload)* igAcceptDragDropPayload(const(char)* type, ImGuiDragDropFlags flags);
void igEndDragDropTarget();
const(ImGuiPayload)* igGetDragDropPayload();
void igBeginDisabled(bool disabled);
void igEndDisabled();
void igPushClipRect(const ImVec2 clip_rect_min, const ImVec2 clip_rect_max,
        bool intersect_with_current_clip_rect);
void igPopClipRect();
void igSetItemDefaultFocus();
void igSetKeyboardFocusHere(int offset);
void igSetNextItemAllowOverlap();
bool igIsItemHovered(ImGuiHoveredFlags flags);
bool igIsItemActive();
bool igIsItemFocused();
bool igIsItemClicked(ImGuiMouseButton mouse_button);
bool igIsItemVisible();
bool igIsItemEdited();
bool igIsItemActivated();
bool igIsItemDeactivated();
bool igIsItemDeactivatedAfterEdit();
bool igIsItemToggledOpen();
bool igIsAnyItemHovered();
bool igIsAnyItemActive();
bool igIsAnyItemFocused();
ImGuiID igGetItemID();
void igGetItemRectMin(ImVec2* pOut);
void igGetItemRectMax(ImVec2* pOut);
void igGetItemRectSize(ImVec2* pOut);
ImGuiViewport* igGetMainViewport();
ImDrawList* igGetBackgroundDrawList_Nil();
ImDrawList* igGetForegroundDrawList_Nil();
bool igIsRectVisible_Nil(const ImVec2 size);
bool igIsRectVisible_Vec2(const ImVec2 rect_min, const ImVec2 rect_max);
double igGetTime();
int igGetFrameCount();
ImDrawListSharedData* igGetDrawListSharedData();
const(char)* igGetStyleColorName(ImGuiCol idx);
void igSetStateStorage(ImGuiStorage* storage);
ImGuiStorage* igGetStateStorage();
bool igBeginChildFrame(ImGuiID id, const ImVec2 size, ImGuiWindowFlags flags);
void igEndChildFrame();
void igCalcTextSize(ImVec2* pOut, const(char)* text, const(char)* text_end,
        bool hide_text_after_double_hash, float wrap_width);
void igColorConvertU32ToFloat4(ImVec4* pOut, ImU32 in_);
ImU32 igColorConvertFloat4ToU32(const ImVec4 in_);
void igColorConvertRGBtoHSV(float r, float g, float b, float* out_h, float* out_s, float* out_v);
void igColorConvertHSVtoRGB(float h, float s, float v, float* out_r, float* out_g, float* out_b);
bool igIsKeyDown_Nil(ImGuiKey key);
bool igIsKeyPressed_Bool(ImGuiKey key, bool repeat);
bool igIsKeyReleased_Nil(ImGuiKey key);
int igGetKeyPressedAmount(ImGuiKey key, float repeat_delay, float rate);
const(char)* igGetKeyName(ImGuiKey key);
void igSetNextFrameWantCaptureKeyboard(bool want_capture_keyboard);
bool igIsMouseDown_Nil(ImGuiMouseButton button);
bool igIsMouseClicked_Bool(ImGuiMouseButton button, bool repeat);
bool igIsMouseReleased_Nil(ImGuiMouseButton button);
bool igIsMouseDoubleClicked(ImGuiMouseButton button);
int igGetMouseClickedCount(ImGuiMouseButton button);
bool igIsMouseHoveringRect(const ImVec2 r_min, const ImVec2 r_max, bool clip);
bool igIsMousePosValid(const(ImVec2)* mouse_pos);
bool igIsAnyMouseDown();
void igGetMousePos(ImVec2* pOut);
void igGetMousePosOnOpeningCurrentPopup(ImVec2* pOut);
bool igIsMouseDragging(ImGuiMouseButton button, float lock_threshold);
void igGetMouseDragDelta(ImVec2* pOut, ImGuiMouseButton button, float lock_threshold);
void igResetMouseDragDelta(ImGuiMouseButton button);
ImGuiMouseCursor igGetMouseCursor();
void igSetMouseCursor(ImGuiMouseCursor cursor_type);
void igSetNextFrameWantCaptureMouse(bool want_capture_mouse);
const(char)* igGetClipboardText();
void igSetClipboardText(const(char)* text);
void igLoadIniSettingsFromDisk(const(char)* ini_filename);
void igLoadIniSettingsFromMemory(const(char)* ini_data, size_t ini_size);
void igSaveIniSettingsToDisk(const(char)* ini_filename);
const(char)* igSaveIniSettingsToMemory(size_t* out_ini_size);
void igDebugTextEncoding(const(char)* text);
bool igDebugCheckVersionAndDataLayout(const(char)* version_str, size_t sz_io,
        size_t sz_style, size_t sz_vec2, size_t sz_vec4, size_t sz_drawvert, size_t sz_drawidx);
void igSetAllocatorFunctions(ImGuiMemAllocFunc alloc_func,
        ImGuiMemFreeFunc free_func, void* user_data);
void igGetAllocatorFunctions(ImGuiMemAllocFunc* p_alloc_func,
        ImGuiMemFreeFunc* p_free_func, void** p_user_data);
void* igMemAlloc(size_t size);
void igMemFree(void* ptr);
ImGuiStyle* ImGuiStyle_ImGuiStyle();
void ImGuiStyle_destroy(ImGuiStyle* self);
void ImGuiStyle_ScaleAllSizes(ImGuiStyle* self, float scale_factor);
void ImGuiIO_AddKeyEvent(ImGuiIO* self, ImGuiKey key, bool down);
void ImGuiIO_AddKeyAnalogEvent(ImGuiIO* self, ImGuiKey key, bool down, float v);
void ImGuiIO_AddMousePosEvent(ImGuiIO* self, float x, float y);
void ImGuiIO_AddMouseButtonEvent(ImGuiIO* self, int button, bool down);
void ImGuiIO_AddMouseWheelEvent(ImGuiIO* self, float wheel_x, float wheel_y);
void ImGuiIO_AddMouseSourceEvent(ImGuiIO* self, ImGuiMouseSource source);
void ImGuiIO_AddFocusEvent(ImGuiIO* self, bool focused);
void ImGuiIO_AddInputCharacter(ImGuiIO* self, uint c);
void ImGuiIO_AddInputCharacterUTF16(ImGuiIO* self, ImWchar16 c);
void ImGuiIO_AddInputCharactersUTF8(ImGuiIO* self, const(char)* str);
void ImGuiIO_SetKeyEventNativeData(ImGuiIO* self, ImGuiKey key,
        int native_keycode, int native_scancode, int native_legacy_index);
void ImGuiIO_SetAppAcceptingEvents(ImGuiIO* self, bool accepting_events);
void ImGuiIO_ClearEventsQueue(ImGuiIO* self);
void ImGuiIO_ClearInputKeys(ImGuiIO* self);
ImGuiIO* ImGuiIO_ImGuiIO();
void ImGuiIO_destroy(ImGuiIO* self);
ImGuiInputTextCallbackData* ImGuiInputTextCallbackData_ImGuiInputTextCallbackData();
void ImGuiInputTextCallbackData_destroy(ImGuiInputTextCallbackData* self);
void ImGuiInputTextCallbackData_DeleteChars(ImGuiInputTextCallbackData* self,
        int pos, int bytes_count);
void ImGuiInputTextCallbackData_InsertChars(ImGuiInputTextCallbackData* self,
        int pos, const(char)* text, const(char)* text_end);
void ImGuiInputTextCallbackData_SelectAll(ImGuiInputTextCallbackData* self);
void ImGuiInputTextCallbackData_ClearSelection(ImGuiInputTextCallbackData* self);
bool ImGuiInputTextCallbackData_HasSelection(ImGuiInputTextCallbackData* self);
ImGuiPayload* ImGuiPayload_ImGuiPayload();
void ImGuiPayload_destroy(ImGuiPayload* self);
void ImGuiPayload_Clear(ImGuiPayload* self);
bool ImGuiPayload_IsDataType(ImGuiPayload* self, const(char)* type);
bool ImGuiPayload_IsPreview(ImGuiPayload* self);
bool ImGuiPayload_IsDelivery(ImGuiPayload* self);
ImGuiTableColumnSortSpecs* ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs();
void ImGuiTableColumnSortSpecs_destroy(ImGuiTableColumnSortSpecs* self);
ImGuiTableSortSpecs* ImGuiTableSortSpecs_ImGuiTableSortSpecs();
void ImGuiTableSortSpecs_destroy(ImGuiTableSortSpecs* self);
ImGuiOnceUponAFrame* ImGuiOnceUponAFrame_ImGuiOnceUponAFrame();
void ImGuiOnceUponAFrame_destroy(ImGuiOnceUponAFrame* self);
ImGuiTextFilter* ImGuiTextFilter_ImGuiTextFilter(const(char)* default_filter);
void ImGuiTextFilter_destroy(ImGuiTextFilter* self);
bool ImGuiTextFilter_Draw(ImGuiTextFilter* self, const(char)* label, float width);
bool ImGuiTextFilter_PassFilter(ImGuiTextFilter* self, const(char)* text, const(char)* text_end);
void ImGuiTextFilter_Build(ImGuiTextFilter* self);
void ImGuiTextFilter_Clear(ImGuiTextFilter* self);
bool ImGuiTextFilter_IsActive(ImGuiTextFilter* self);
ImGuiTextRange* ImGuiTextRange_ImGuiTextRange_Nil();
void ImGuiTextRange_destroy(ImGuiTextRange* self);
ImGuiTextRange* ImGuiTextRange_ImGuiTextRange_Str(const(char)* _b, const(char)* _e);
bool ImGuiTextRange_empty(ImGuiTextRange* self);
void ImGuiTextRange_split(ImGuiTextRange* self, char separator, ImVector_ImGuiTextRange* out_);
ImGuiTextBuffer* ImGuiTextBuffer_ImGuiTextBuffer();
void ImGuiTextBuffer_destroy(ImGuiTextBuffer* self);
const(char)* ImGuiTextBuffer_begin(ImGuiTextBuffer* self);
const(char)* ImGuiTextBuffer_end(ImGuiTextBuffer* self);
int ImGuiTextBuffer_size(ImGuiTextBuffer* self);
bool ImGuiTextBuffer_empty(ImGuiTextBuffer* self);
void ImGuiTextBuffer_clear(ImGuiTextBuffer* self);
void ImGuiTextBuffer_reserve(ImGuiTextBuffer* self, int capacity);
const(char)* ImGuiTextBuffer_c_str(ImGuiTextBuffer* self);
void ImGuiTextBuffer_append(ImGuiTextBuffer* self, const(char)* str, const(char)* str_end);
void ImGuiTextBuffer_appendfv(ImGuiTextBuffer* self, const(char)* fmt, va_list args);
ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Int(ImGuiID _key, int _val_i);
void ImGuiStoragePair_destroy(ImGuiStoragePair* self);
ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Float(ImGuiID _key, float _val_f);
ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Ptr(ImGuiID _key, void* _val_p);
void ImGuiStorage_Clear(ImGuiStorage* self);
int ImGuiStorage_GetInt(ImGuiStorage* self, ImGuiID key, int default_val);
void ImGuiStorage_SetInt(ImGuiStorage* self, ImGuiID key, int val);
bool ImGuiStorage_GetBool(ImGuiStorage* self, ImGuiID key, bool default_val);
void ImGuiStorage_SetBool(ImGuiStorage* self, ImGuiID key, bool val);
float ImGuiStorage_GetFloat(ImGuiStorage* self, ImGuiID key, float default_val);
void ImGuiStorage_SetFloat(ImGuiStorage* self, ImGuiID key, float val);
void* ImGuiStorage_GetVoidPtr(ImGuiStorage* self, ImGuiID key);
void ImGuiStorage_SetVoidPtr(ImGuiStorage* self, ImGuiID key, void* val);
int* ImGuiStorage_GetIntRef(ImGuiStorage* self, ImGuiID key, int default_val);
bool* ImGuiStorage_GetBoolRef(ImGuiStorage* self, ImGuiID key, bool default_val);
float* ImGuiStorage_GetFloatRef(ImGuiStorage* self, ImGuiID key, float default_val);
void** ImGuiStorage_GetVoidPtrRef(ImGuiStorage* self, ImGuiID key, void* default_val);
void ImGuiStorage_SetAllInt(ImGuiStorage* self, int val);
void ImGuiStorage_BuildSortByKey(ImGuiStorage* self);
ImGuiListClipper* ImGuiListClipper_ImGuiListClipper();
void ImGuiListClipper_destroy(ImGuiListClipper* self);
void ImGuiListClipper_Begin(ImGuiListClipper* self, int items_count, float items_height);
void ImGuiListClipper_End(ImGuiListClipper* self);
bool ImGuiListClipper_Step(ImGuiListClipper* self);
void ImGuiListClipper_IncludeItemByIndex(ImGuiListClipper* self, int item_index);
void ImGuiListClipper_IncludeItemsByIndex(ImGuiListClipper* self, int item_begin, int item_end);
ImColor* ImColor_ImColor_Nil();
void ImColor_destroy(ImColor* self);
ImColor* ImColor_ImColor_Float(float r, float g, float b, float a);
ImColor* ImColor_ImColor_Vec4(const ImVec4 col);
ImColor* ImColor_ImColor_Int(int r, int g, int b, int a);
ImColor* ImColor_ImColor_U32(ImU32 rgba);
void ImColor_SetHSV(ImColor* self, float h, float s, float v, float a);
void ImColor_HSV(ImColor* pOut, float h, float s, float v, float a);
ImDrawCmd* ImDrawCmd_ImDrawCmd();
void ImDrawCmd_destroy(ImDrawCmd* self);
ImTextureID ImDrawCmd_GetTexID(ImDrawCmd* self);
ImDrawListSplitter* ImDrawListSplitter_ImDrawListSplitter();
void ImDrawListSplitter_destroy(ImDrawListSplitter* self);
void ImDrawListSplitter_Clear(ImDrawListSplitter* self);
void ImDrawListSplitter_ClearFreeMemory(ImDrawListSplitter* self);
void ImDrawListSplitter_Split(ImDrawListSplitter* self, ImDrawList* draw_list, int count);
void ImDrawListSplitter_Merge(ImDrawListSplitter* self, ImDrawList* draw_list);
void ImDrawListSplitter_SetCurrentChannel(ImDrawListSplitter* self,
        ImDrawList* draw_list, int channel_idx);
ImDrawList* ImDrawList_ImDrawList(ImDrawListSharedData* shared_data);
void ImDrawList_destroy(ImDrawList* self);
void ImDrawList_PushClipRect(ImDrawList* self, const ImVec2 clip_rect_min,
        const ImVec2 clip_rect_max, bool intersect_with_current_clip_rect);
void ImDrawList_PushClipRectFullScreen(ImDrawList* self);
void ImDrawList_PopClipRect(ImDrawList* self);
void ImDrawList_PushTextureID(ImDrawList* self, ImTextureID texture_id);
void ImDrawList_PopTextureID(ImDrawList* self);
void ImDrawList_GetClipRectMin(ImVec2* pOut, ImDrawList* self);
void ImDrawList_GetClipRectMax(ImVec2* pOut, ImDrawList* self);
void ImDrawList_AddLine(ImDrawList* self, const ImVec2 p1, const ImVec2 p2,
        ImU32 col, float thickness);
void ImDrawList_AddRect(ImDrawList* self, const ImVec2 p_min, const ImVec2 p_max,
        ImU32 col, float rounding, ImDrawFlags flags, float thickness);
void ImDrawList_AddRectFilled(ImDrawList* self, const ImVec2 p_min,
        const ImVec2 p_max, ImU32 col, float rounding, ImDrawFlags flags);
void ImDrawList_AddRectFilledMultiColor(ImDrawList* self, const ImVec2 p_min, const ImVec2 p_max,
        ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left);
void ImDrawList_AddQuad(ImDrawList* self, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, ImU32 col, float thickness);
void ImDrawList_AddQuadFilled(ImDrawList* self, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, ImU32 col);
void ImDrawList_AddTriangle(ImDrawList* self, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, ImU32 col, float thickness);
void ImDrawList_AddTriangleFilled(ImDrawList* self, const ImVec2 p1,
        const ImVec2 p2, const ImVec2 p3, ImU32 col);
void ImDrawList_AddCircle(ImDrawList* self, const ImVec2 center, float radius,
        ImU32 col, int num_segments, float thickness);
void ImDrawList_AddCircleFilled(ImDrawList* self, const ImVec2 center,
        float radius, ImU32 col, int num_segments);
void ImDrawList_AddNgon(ImDrawList* self, const ImVec2 center, float radius,
        ImU32 col, int num_segments, float thickness);
void ImDrawList_AddNgonFilled(ImDrawList* self, const ImVec2 center, float radius,
        ImU32 col, int num_segments);
void ImDrawList_AddText_Vec2(ImDrawList* self, const ImVec2 pos, ImU32 col,
        const(char)* text_begin, const(char)* text_end);
void ImDrawList_AddText_FontPtr(ImDrawList* self, const(ImFont)* font,
        float font_size, const ImVec2 pos, ImU32 col, const(char)* text_begin,
        const(char)* text_end, float wrap_width, const(ImVec4)* cpu_fine_clip_rect);
void ImDrawList_AddPolyline(ImDrawList* self, const(ImVec2)* points,
        int num_points, ImU32 col, ImDrawFlags flags, float thickness);
void ImDrawList_AddConvexPolyFilled(ImDrawList* self, const(ImVec2)* points,
        int num_points, ImU32 col);
void ImDrawList_AddBezierCubic(ImDrawList* self, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, ImU32 col, float thickness, int num_segments);
void ImDrawList_AddBezierQuadratic(ImDrawList* self, const ImVec2 p1,
        const ImVec2 p2, const ImVec2 p3, ImU32 col, float thickness, int num_segments);
void ImDrawList_AddImage(ImDrawList* self, ImTextureID user_texture_id,
        const ImVec2 p_min, const ImVec2 p_max, const ImVec2 uv_min, const ImVec2 uv_max, ImU32 col);
void ImDrawList_AddImageQuad(ImDrawList* self, ImTextureID user_texture_id, const ImVec2 p1,
        const ImVec2 p2, const ImVec2 p3, const ImVec2 p4, const ImVec2 uv1,
        const ImVec2 uv2, const ImVec2 uv3, const ImVec2 uv4, ImU32 col);
void ImDrawList_AddImageRounded(ImDrawList* self, ImTextureID user_texture_id, const ImVec2 p_min, const ImVec2 p_max,
        const ImVec2 uv_min, const ImVec2 uv_max, ImU32 col, float rounding, ImDrawFlags flags);
void ImDrawList_PathClear(ImDrawList* self);
void ImDrawList_PathLineTo(ImDrawList* self, const ImVec2 pos);
void ImDrawList_PathLineToMergeDuplicate(ImDrawList* self, const ImVec2 pos);
void ImDrawList_PathFillConvex(ImDrawList* self, ImU32 col);
void ImDrawList_PathStroke(ImDrawList* self, ImU32 col, ImDrawFlags flags, float thickness);
void ImDrawList_PathArcTo(ImDrawList* self, const ImVec2 center, float radius,
        float a_min, float a_max, int num_segments);
void ImDrawList_PathArcToFast(ImDrawList* self, const ImVec2 center, float radius,
        int a_min_of_12, int a_max_of_12);
void ImDrawList_PathBezierCubicCurveTo(ImDrawList* self, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, int num_segments);
void ImDrawList_PathBezierQuadraticCurveTo(ImDrawList* self, const ImVec2 p2,
        const ImVec2 p3, int num_segments);
void ImDrawList_PathRect(ImDrawList* self, const ImVec2 rect_min,
        const ImVec2 rect_max, float rounding, ImDrawFlags flags);
void ImDrawList_AddCallback(ImDrawList* self, ImDrawCallback callback, void* callback_data);
void ImDrawList_AddDrawCmd(ImDrawList* self);
ImDrawList* ImDrawList_CloneOutput(ImDrawList* self);
void ImDrawList_ChannelsSplit(ImDrawList* self, int count);
void ImDrawList_ChannelsMerge(ImDrawList* self);
void ImDrawList_ChannelsSetCurrent(ImDrawList* self, int n);
void ImDrawList_PrimReserve(ImDrawList* self, int idx_count, int vtx_count);
void ImDrawList_PrimUnreserve(ImDrawList* self, int idx_count, int vtx_count);
void ImDrawList_PrimRect(ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col);
void ImDrawList_PrimRectUV(ImDrawList* self, const ImVec2 a, const ImVec2 b,
        const ImVec2 uv_a, const ImVec2 uv_b, ImU32 col);
void ImDrawList_PrimQuadUV(ImDrawList* self, const ImVec2 a, const ImVec2 b,
        const ImVec2 c, const ImVec2 d, const ImVec2 uv_a, const ImVec2 uv_b,
        const ImVec2 uv_c, const ImVec2 uv_d, ImU32 col);
void ImDrawList_PrimWriteVtx(ImDrawList* self, const ImVec2 pos, const ImVec2 uv, ImU32 col);
void ImDrawList_PrimWriteIdx(ImDrawList* self, ImDrawIdx idx);
void ImDrawList_PrimVtx(ImDrawList* self, const ImVec2 pos, const ImVec2 uv, ImU32 col);
void ImDrawList__ResetForNewFrame(ImDrawList* self);
void ImDrawList__ClearFreeMemory(ImDrawList* self);
void ImDrawList__PopUnusedDrawCmd(ImDrawList* self);
void ImDrawList__TryMergeDrawCmds(ImDrawList* self);
void ImDrawList__OnChangedClipRect(ImDrawList* self);
void ImDrawList__OnChangedTextureID(ImDrawList* self);
void ImDrawList__OnChangedVtxOffset(ImDrawList* self);
int ImDrawList__CalcCircleAutoSegmentCount(ImDrawList* self, float radius);
void ImDrawList__PathArcToFastEx(ImDrawList* self, const ImVec2 center,
        float radius, int a_min_sample, int a_max_sample, int a_step);
void ImDrawList__PathArcToN(ImDrawList* self, const ImVec2 center, float radius,
        float a_min, float a_max, int num_segments);
ImDrawData* ImDrawData_ImDrawData();
void ImDrawData_destroy(ImDrawData* self);
void ImDrawData_Clear(ImDrawData* self);
void ImDrawData_AddDrawList(ImDrawData* self, ImDrawList* draw_list);
void ImDrawData_DeIndexAllBuffers(ImDrawData* self);
void ImDrawData_ScaleClipRects(ImDrawData* self, const ImVec2 fb_scale);
ImFontConfig* ImFontConfig_ImFontConfig();
void ImFontConfig_destroy(ImFontConfig* self);
ImFontGlyphRangesBuilder* ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder();
void ImFontGlyphRangesBuilder_destroy(ImFontGlyphRangesBuilder* self);
void ImFontGlyphRangesBuilder_Clear(ImFontGlyphRangesBuilder* self);
bool ImFontGlyphRangesBuilder_GetBit(ImFontGlyphRangesBuilder* self, size_t n);
void ImFontGlyphRangesBuilder_SetBit(ImFontGlyphRangesBuilder* self, size_t n);
void ImFontGlyphRangesBuilder_AddChar(ImFontGlyphRangesBuilder* self, ImWchar c);
void ImFontGlyphRangesBuilder_AddText(ImFontGlyphRangesBuilder* self,
        const(char)* text, const(char)* text_end);
void ImFontGlyphRangesBuilder_AddRanges(ImFontGlyphRangesBuilder* self, const(ImWchar)* ranges);
void ImFontGlyphRangesBuilder_BuildRanges(ImFontGlyphRangesBuilder* self,
        ImVector_ImWchar* out_ranges);
ImFontAtlasCustomRect* ImFontAtlasCustomRect_ImFontAtlasCustomRect();
void ImFontAtlasCustomRect_destroy(ImFontAtlasCustomRect* self);
bool ImFontAtlasCustomRect_IsPacked(ImFontAtlasCustomRect* self);
ImFontAtlas* ImFontAtlas_ImFontAtlas();
void ImFontAtlas_destroy(ImFontAtlas* self);
ImFont* ImFontAtlas_AddFont(ImFontAtlas* self, const(ImFontConfig)* font_cfg);
ImFont* ImFontAtlas_AddFontDefault(ImFontAtlas* self, const(ImFontConfig)* font_cfg);
ImFont* ImFontAtlas_AddFontFromFileTTF(ImFontAtlas* self, const(char)* filename,
        float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
ImFont* ImFontAtlas_AddFontFromMemoryTTF(ImFontAtlas* self, void* font_data, int font_size,
        float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
ImFont* ImFontAtlas_AddFontFromMemoryCompressedTTF(ImFontAtlas* self,
        const(void)* compressed_font_data, int compressed_font_size,
        float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
ImFont* ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(ImFontAtlas* self, const(char)* compressed_font_data_base85,
        float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
void ImFontAtlas_ClearInputData(ImFontAtlas* self);
void ImFontAtlas_ClearTexData(ImFontAtlas* self);
void ImFontAtlas_ClearFonts(ImFontAtlas* self);
void ImFontAtlas_Clear(ImFontAtlas* self);
bool ImFontAtlas_Build(ImFontAtlas* self);
void ImFontAtlas_GetTexDataAsAlpha8(ImFontAtlas* self, ubyte** out_pixels,
        int* out_width, int* out_height, int* out_bytes_per_pixel);
void ImFontAtlas_GetTexDataAsRGBA32(ImFontAtlas* self, ubyte** out_pixels,
        int* out_width, int* out_height, int* out_bytes_per_pixel);
bool ImFontAtlas_IsBuilt(ImFontAtlas* self);
void ImFontAtlas_SetTexID(ImFontAtlas* self, ImTextureID id);
const(ImWchar)* ImFontAtlas_GetGlyphRangesDefault(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesGreek(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesKorean(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesJapanese(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesChineseFull(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesCyrillic(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesThai(ImFontAtlas* self);
const(ImWchar)* ImFontAtlas_GetGlyphRangesVietnamese(ImFontAtlas* self);
int ImFontAtlas_AddCustomRectRegular(ImFontAtlas* self, int width, int height);
int ImFontAtlas_AddCustomRectFontGlyph(ImFontAtlas* self, ImFont* font,
        ImWchar id, int width, int height, float advance_x, const ImVec2 offset);
ImFontAtlasCustomRect* ImFontAtlas_GetCustomRectByIndex(ImFontAtlas* self, int index);
void ImFontAtlas_CalcCustomRectUV(ImFontAtlas* self,
        const(ImFontAtlasCustomRect)* rect, ImVec2* out_uv_min, ImVec2* out_uv_max);
bool ImFontAtlas_GetMouseCursorTexData(ImFontAtlas* self, ImGuiMouseCursor cursor,
        ImVec2* out_offset, ImVec2* out_size, ref ImVec2[2] out_uv_border, ref ImVec2[2] out_uv_fill);
ImFont* ImFont_ImFont();
void ImFont_destroy(ImFont* self);
const(ImFontGlyph)* ImFont_FindGlyph(ImFont* self, ImWchar c);
const(ImFontGlyph)* ImFont_FindGlyphNoFallback(ImFont* self, ImWchar c);
float ImFont_GetCharAdvance(ImFont* self, ImWchar c);
bool ImFont_IsLoaded(ImFont* self);
const(char)* ImFont_GetDebugName(ImFont* self);
void ImFont_CalcTextSizeA(ImVec2* pOut, ImFont* self, float size, float max_width,
        float wrap_width, const(char)* text_begin, const(char)* text_end,
        const(char*)* remaining);
const(char)* ImFont_CalcWordWrapPositionA(ImFont* self, float scale,
        const(char)* text, const(char)* text_end, float wrap_width);
void ImFont_RenderChar(ImFont* self, ImDrawList* draw_list, float size,
        const ImVec2 pos, ImU32 col, ImWchar c);
void ImFont_RenderText(ImFont* self, ImDrawList* draw_list, float size,
        const ImVec2 pos, ImU32 col, const ImVec4 clip_rect, const(char)* text_begin,
        const(char)* text_end, float wrap_width, bool cpu_fine_clip);
void ImFont_BuildLookupTable(ImFont* self);
void ImFont_ClearOutputData(ImFont* self);
void ImFont_GrowIndex(ImFont* self, int new_size);
void ImFont_AddGlyph(ImFont* self, const(ImFontConfig)* src_cfg, ImWchar c,
        float x0, float y0, float x1, float y1, float u0, float v0, float u1,
        float v1, float advance_x);
void ImFont_AddRemapChar(ImFont* self, ImWchar dst, ImWchar src, bool overwrite_dst);
void ImFont_SetGlyphVisible(ImFont* self, ImWchar c, bool visible);
bool ImFont_IsGlyphRangeUnused(ImFont* self, uint c_begin, uint c_last);
ImGuiViewport* ImGuiViewport_ImGuiViewport();
void ImGuiViewport_destroy(ImGuiViewport* self);
void ImGuiViewport_GetCenter(ImVec2* pOut, ImGuiViewport* self);
void ImGuiViewport_GetWorkCenter(ImVec2* pOut, ImGuiViewport* self);
ImGuiPlatformImeData* ImGuiPlatformImeData_ImGuiPlatformImeData();
void ImGuiPlatformImeData_destroy(ImGuiPlatformImeData* self);
ImGuiKey igGetKeyIndex(ImGuiKey key);
ImGuiID igImHashData(const(void)* data, size_t data_size, ImGuiID seed);
ImGuiID igImHashStr(const(char)* data, size_t data_size, ImGuiID seed);
void igImQsort(void* base, size_t count, size_t size_of_element,
        int function(const(void)*, const(void)*) compare_func);
ImU32 igImAlphaBlendColors(ImU32 col_a, ImU32 col_b);
bool igImIsPowerOfTwo_Int(int v);
bool igImIsPowerOfTwo_U64(ImU64 v);
int igImUpperPowerOfTwo(int v);
int igImStricmp(const(char)* str1, const(char)* str2);
int igImStrnicmp(const(char)* str1, const(char)* str2, size_t count);
void igImStrncpy(char* dst, const(char)* src, size_t count);
char* igImStrdup(const(char)* str);
char* igImStrdupcpy(char* dst, size_t* p_dst_size, const(char)* str);
const(char)* igImStrchrRange(const(char)* str_begin, const(char)* str_end, char c);
int igImStrlenW(const(ImWchar)* str);
const(char)* igImStreolRange(const(char)* str, const(char)* str_end);
const(ImWchar)* igImStrbolW(const(ImWchar)* buf_mid_line, const(ImWchar)* buf_begin);
const(char)* igImStristr(const(char)* haystack, const(char)* haystack_end,
        const(char)* needle, const(char)* needle_end);
void igImStrTrimBlanks(char* str);
const(char)* igImStrSkipBlank(const(char)* str);
char igImToUpper(char c);
bool igImCharIsBlankA(char c);
bool igImCharIsBlankW(uint c);
int igImFormatString(char* buf, size_t buf_size, const(char)* fmt, ...);
int igImFormatStringV(char* buf, size_t buf_size, const(char)* fmt, va_list args);
void igImFormatStringToTempBuffer(const(char*)* out_buf,
        const(char*)* out_buf_end, const(char)* fmt, ...);
void igImFormatStringToTempBufferV(const(char*)* out_buf,
        const(char*)* out_buf_end, const(char)* fmt, va_list args);
const(char)* igImParseFormatFindStart(const(char)* format);
const(char)* igImParseFormatFindEnd(const(char)* format);
const(char)* igImParseFormatTrimDecorations(const(char)* format, char* buf, size_t buf_size);
void igImParseFormatSanitizeForPrinting(const(char)* fmt_in, char* fmt_out, size_t fmt_out_size);
const(char)* igImParseFormatSanitizeForScanning(const(char)* fmt_in,
        char* fmt_out, size_t fmt_out_size);
int igImParseFormatPrecision(const(char)* format, int default_value);
const(char)* igImTextCharToUtf8(ref char[5] out_buf, uint c);
int igImTextStrToUtf8(char* out_buf, int out_buf_size, const(ImWchar)* in_text,
        const(ImWchar)* in_text_end);
int igImTextCharFromUtf8(uint* out_char, const(char)* in_text, const(char)* in_text_end);
int igImTextStrFromUtf8(ImWchar* out_buf, int out_buf_size,
        const(char)* in_text, const(char)* in_text_end, const(char*)* in_remaining);
int igImTextCountCharsFromUtf8(const(char)* in_text, const(char)* in_text_end);
int igImTextCountUtf8BytesFromChar(const(char)* in_text, const(char)* in_text_end);
int igImTextCountUtf8BytesFromStr(const(ImWchar)* in_text, const(ImWchar)* in_text_end);
ImFileHandle igImFileOpen(const(char)* filename, const(char)* mode);
bool igImFileClose(ImFileHandle file);
ImU64 igImFileGetSize(ImFileHandle file);
ImU64 igImFileRead(void* data, ImU64 size, ImU64 count, ImFileHandle file);
ImU64 igImFileWrite(const(void)* data, ImU64 size, ImU64 count, ImFileHandle file);
void* igImFileLoadToMemory(const(char)* filename, const(char)* mode,
        size_t* out_file_size, int padding_bytes);
float igImPow_Float(float x, float y);
double igImPow_double(double x, double y);
float igImLog_Float(float x);
double igImLog_double(double x);
int igImAbs_Int(int x);
float igImAbs_Float(float x);
double igImAbs_double(double x);
float igImSign_Float(float x);
double igImSign_double(double x);
float igImRsqrt_Float(float x);
double igImRsqrt_double(double x);
void igImMin(ImVec2* pOut, const ImVec2 lhs, const ImVec2 rhs);
void igImMax(ImVec2* pOut, const ImVec2 lhs, const ImVec2 rhs);
void igImClamp(ImVec2* pOut, const ImVec2 v, const ImVec2 mn, ImVec2 mx);
void igImLerp_Vec2Float(ImVec2* pOut, const ImVec2 a, const ImVec2 b, float t);
void igImLerp_Vec2Vec2(ImVec2* pOut, const ImVec2 a, const ImVec2 b, const ImVec2 t);
void igImLerp_Vec4(ImVec4* pOut, const ImVec4 a, const ImVec4 b, float t);
float igImSaturate(float f);
float igImLengthSqr_Vec2(const ImVec2 lhs);
float igImLengthSqr_Vec4(const ImVec4 lhs);
float igImInvLength(const ImVec2 lhs, float fail_value);
float igImFloor_Float(float f);
float igImFloorSigned_Float(float f);
void igImFloor_Vec2(ImVec2* pOut, const ImVec2 v);
void igImFloorSigned_Vec2(ImVec2* pOut, const ImVec2 v);
int igImModPositive(int a, int b);
float igImDot(const ImVec2 a, const ImVec2 b);
void igImRotate(ImVec2* pOut, const ImVec2 v, float cos_a, float sin_a);
float igImLinearSweep(float current, float target, float speed);
void igImMul(ImVec2* pOut, const ImVec2 lhs, const ImVec2 rhs);
bool igImIsFloatAboveGuaranteedIntegerPrecision(float f);
float igImExponentialMovingAverage(float avg, float sample, int n);
void igImBezierCubicCalc(ImVec2* pOut, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, float t);
void igImBezierCubicClosestPoint(ImVec2* pOut, const ImVec2 p1, const ImVec2 p2,
        const ImVec2 p3, const ImVec2 p4, const ImVec2 p, int num_segments);
void igImBezierCubicClosestPointCasteljau(ImVec2* pOut, const ImVec2 p1,
        const ImVec2 p2, const ImVec2 p3, const ImVec2 p4, const ImVec2 p, float tess_tol);
void igImBezierQuadraticCalc(ImVec2* pOut, const ImVec2 p1, const ImVec2 p2, const ImVec2 p3,
        float t);
void igImLineClosestPoint(ImVec2* pOut, const ImVec2 a, const ImVec2 b, const ImVec2 p);
bool igImTriangleContainsPoint(const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 p);
void igImTriangleClosestPoint(ImVec2* pOut, const ImVec2 a, const ImVec2 b,
        const ImVec2 c, const ImVec2 p);
void igImTriangleBarycentricCoords(const ImVec2 a, const ImVec2 b, const ImVec2 c,
        const ImVec2 p, float* out_u, float* out_v, float* out_w);
float igImTriangleArea(const ImVec2 a, const ImVec2 b, const ImVec2 c);
ImVec1* ImVec1_ImVec1_Nil();
void ImVec1_destroy(ImVec1* self);
ImVec1* ImVec1_ImVec1_Float(float _x);
ImVec2ih* ImVec2ih_ImVec2ih_Nil();
void ImVec2ih_destroy(ImVec2ih* self);
ImVec2ih* ImVec2ih_ImVec2ih_short(short _x, short _y);
ImVec2ih* ImVec2ih_ImVec2ih_Vec2(const ImVec2 rhs);
ImRect* ImRect_ImRect_Nil();
void ImRect_destroy(ImRect* self);
ImRect* ImRect_ImRect_Vec2(const ImVec2 min, const ImVec2 max);
ImRect* ImRect_ImRect_Vec4(const ImVec4 v);
ImRect* ImRect_ImRect_Float(float x1, float y1, float x2, float y2);
void ImRect_GetCenter(ImVec2* pOut, ImRect* self);
void ImRect_GetSize(ImVec2* pOut, ImRect* self);
float ImRect_GetWidth(ImRect* self);
float ImRect_GetHeight(ImRect* self);
float ImRect_GetArea(ImRect* self);
void ImRect_GetTL(ImVec2* pOut, ImRect* self);
void ImRect_GetTR(ImVec2* pOut, ImRect* self);
void ImRect_GetBL(ImVec2* pOut, ImRect* self);
void ImRect_GetBR(ImVec2* pOut, ImRect* self);
bool ImRect_Contains_Vec2(ImRect* self, const ImVec2 p);
bool ImRect_Contains_Rect(ImRect* self, const ImRect r);
bool ImRect_Overlaps(ImRect* self, const ImRect r);
void ImRect_Add_Vec2(ImRect* self, const ImVec2 p);
void ImRect_Add_Rect(ImRect* self, const ImRect r);
void ImRect_Expand_Float(ImRect* self, const float amount);
void ImRect_Expand_Vec2(ImRect* self, const ImVec2 amount);
void ImRect_Translate(ImRect* self, const ImVec2 d);
void ImRect_TranslateX(ImRect* self, float dx);
void ImRect_TranslateY(ImRect* self, float dy);
void ImRect_ClipWith(ImRect* self, const ImRect r);
void ImRect_ClipWithFull(ImRect* self, const ImRect r);
void ImRect_Floor(ImRect* self);
bool ImRect_IsInverted(ImRect* self);
void ImRect_ToVec4(ImVec4* pOut, ImRect* self);
size_t igImBitArrayGetStorageSizeInBytes(int bitcount);
void igImBitArrayClearAllBits(ImU32* arr, int bitcount);
bool igImBitArrayTestBit(const(ImU32)* arr, int n);
void igImBitArrayClearBit(ImU32* arr, int n);
void igImBitArraySetBit(ImU32* arr, int n);
void igImBitArraySetBitRange(ImU32* arr, int n, int n2);
void ImBitVector_Create(ImBitVector* self, int sz);
void ImBitVector_Clear(ImBitVector* self);
bool ImBitVector_TestBit(ImBitVector* self, int n);
void ImBitVector_SetBit(ImBitVector* self, int n);
void ImBitVector_ClearBit(ImBitVector* self, int n);
void ImGuiTextIndex_clear(ImGuiTextIndex* self);
int ImGuiTextIndex_size(ImGuiTextIndex* self);
const(char)* ImGuiTextIndex_get_line_begin(ImGuiTextIndex* self, const(char)* base, int n);
const(char)* ImGuiTextIndex_get_line_end(ImGuiTextIndex* self, const(char)* base, int n);
void ImGuiTextIndex_append(ImGuiTextIndex* self, const(char)* base, int old_size, int new_size);
ImDrawListSharedData* ImDrawListSharedData_ImDrawListSharedData();
void ImDrawListSharedData_destroy(ImDrawListSharedData* self);
void ImDrawListSharedData_SetCircleTessellationMaxError(ImDrawListSharedData* self, float max_error);
ImDrawDataBuilder* ImDrawDataBuilder_ImDrawDataBuilder();
void ImDrawDataBuilder_destroy(ImDrawDataBuilder* self);
void* ImGuiDataVarInfo_GetVarPtr(ImGuiDataVarInfo* self, void* parent);
ImGuiStyleMod* ImGuiStyleMod_ImGuiStyleMod_Int(ImGuiStyleVar idx, int v);
void ImGuiStyleMod_destroy(ImGuiStyleMod* self);
ImGuiStyleMod* ImGuiStyleMod_ImGuiStyleMod_Float(ImGuiStyleVar idx, float v);
ImGuiStyleMod* ImGuiStyleMod_ImGuiStyleMod_Vec2(ImGuiStyleVar idx, ImVec2 v);
ImGuiComboPreviewData* ImGuiComboPreviewData_ImGuiComboPreviewData();
void ImGuiComboPreviewData_destroy(ImGuiComboPreviewData* self);
ImGuiMenuColumns* ImGuiMenuColumns_ImGuiMenuColumns();
void ImGuiMenuColumns_destroy(ImGuiMenuColumns* self);
void ImGuiMenuColumns_Update(ImGuiMenuColumns* self, float spacing, bool window_reappearing);
float ImGuiMenuColumns_DeclColumns(ImGuiMenuColumns* self, float w_icon,
        float w_label, float w_shortcut, float w_mark);
void ImGuiMenuColumns_CalcNextTotalWidth(ImGuiMenuColumns* self, bool update_offsets);
ImGuiInputTextDeactivatedState* ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState();
void ImGuiInputTextDeactivatedState_destroy(ImGuiInputTextDeactivatedState* self);
void ImGuiInputTextDeactivatedState_ClearFreeMemory(ImGuiInputTextDeactivatedState* self);
ImGuiInputTextState* ImGuiInputTextState_ImGuiInputTextState();
void ImGuiInputTextState_destroy(ImGuiInputTextState* self);
void ImGuiInputTextState_ClearText(ImGuiInputTextState* self);
void ImGuiInputTextState_ClearFreeMemory(ImGuiInputTextState* self);
int ImGuiInputTextState_GetUndoAvailCount(ImGuiInputTextState* self);
int ImGuiInputTextState_GetRedoAvailCount(ImGuiInputTextState* self);
void ImGuiInputTextState_OnKeyPressed(ImGuiInputTextState* self, int key);
void ImGuiInputTextState_CursorAnimReset(ImGuiInputTextState* self);
void ImGuiInputTextState_CursorClamp(ImGuiInputTextState* self);
bool ImGuiInputTextState_HasSelection(ImGuiInputTextState* self);
void ImGuiInputTextState_ClearSelection(ImGuiInputTextState* self);
int ImGuiInputTextState_GetCursorPos(ImGuiInputTextState* self);
int ImGuiInputTextState_GetSelectionStart(ImGuiInputTextState* self);
int ImGuiInputTextState_GetSelectionEnd(ImGuiInputTextState* self);
void ImGuiInputTextState_SelectAll(ImGuiInputTextState* self);
ImGuiPopupData* ImGuiPopupData_ImGuiPopupData();
void ImGuiPopupData_destroy(ImGuiPopupData* self);
ImGuiNextWindowData* ImGuiNextWindowData_ImGuiNextWindowData();
void ImGuiNextWindowData_destroy(ImGuiNextWindowData* self);
void ImGuiNextWindowData_ClearFlags(ImGuiNextWindowData* self);
ImGuiNextItemData* ImGuiNextItemData_ImGuiNextItemData();
void ImGuiNextItemData_destroy(ImGuiNextItemData* self);
void ImGuiNextItemData_ClearFlags(ImGuiNextItemData* self);
ImGuiLastItemData* ImGuiLastItemData_ImGuiLastItemData();
void ImGuiLastItemData_destroy(ImGuiLastItemData* self);
ImGuiStackSizes* ImGuiStackSizes_ImGuiStackSizes();
void ImGuiStackSizes_destroy(ImGuiStackSizes* self);
void ImGuiStackSizes_SetToContextState(ImGuiStackSizes* self, ImGuiContext* ctx);
void ImGuiStackSizes_CompareWithContextState(ImGuiStackSizes* self, ImGuiContext* ctx);
ImGuiPtrOrIndex* ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(void* ptr);
void ImGuiPtrOrIndex_destroy(ImGuiPtrOrIndex* self);
ImGuiPtrOrIndex* ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(int index);
ImGuiInputEvent* ImGuiInputEvent_ImGuiInputEvent();
void ImGuiInputEvent_destroy(ImGuiInputEvent* self);
ImGuiKeyRoutingData* ImGuiKeyRoutingData_ImGuiKeyRoutingData();
void ImGuiKeyRoutingData_destroy(ImGuiKeyRoutingData* self);
ImGuiKeyRoutingTable* ImGuiKeyRoutingTable_ImGuiKeyRoutingTable();
void ImGuiKeyRoutingTable_destroy(ImGuiKeyRoutingTable* self);
void ImGuiKeyRoutingTable_Clear(ImGuiKeyRoutingTable* self);
ImGuiKeyOwnerData* ImGuiKeyOwnerData_ImGuiKeyOwnerData();
void ImGuiKeyOwnerData_destroy(ImGuiKeyOwnerData* self);
ImGuiListClipperRange ImGuiListClipperRange_FromIndices(int min, int max);
ImGuiListClipperRange ImGuiListClipperRange_FromPositions(float y1, float y2,
        int off_min, int off_max);
ImGuiListClipperData* ImGuiListClipperData_ImGuiListClipperData();
void ImGuiListClipperData_destroy(ImGuiListClipperData* self);
void ImGuiListClipperData_Reset(ImGuiListClipperData* self, ImGuiListClipper* clipper);
ImGuiNavItemData* ImGuiNavItemData_ImGuiNavItemData();
void ImGuiNavItemData_destroy(ImGuiNavItemData* self);
void ImGuiNavItemData_Clear(ImGuiNavItemData* self);
ImGuiOldColumnData* ImGuiOldColumnData_ImGuiOldColumnData();
void ImGuiOldColumnData_destroy(ImGuiOldColumnData* self);
ImGuiOldColumns* ImGuiOldColumns_ImGuiOldColumns();
void ImGuiOldColumns_destroy(ImGuiOldColumns* self);
ImGuiViewportP* ImGuiViewportP_ImGuiViewportP();
void ImGuiViewportP_destroy(ImGuiViewportP* self);
void ImGuiViewportP_CalcWorkRectPos(ImVec2* pOut, ImGuiViewportP* self, const ImVec2 off_min);
void ImGuiViewportP_CalcWorkRectSize(ImVec2* pOut, ImGuiViewportP* self,
        const ImVec2 off_min, const ImVec2 off_max);
void ImGuiViewportP_UpdateWorkRect(ImGuiViewportP* self);
void ImGuiViewportP_GetMainRect(ImRect* pOut, ImGuiViewportP* self);
void ImGuiViewportP_GetWorkRect(ImRect* pOut, ImGuiViewportP* self);
void ImGuiViewportP_GetBuildWorkRect(ImRect* pOut, ImGuiViewportP* self);
ImGuiWindowSettings* ImGuiWindowSettings_ImGuiWindowSettings();
void ImGuiWindowSettings_destroy(ImGuiWindowSettings* self);
char* ImGuiWindowSettings_GetName(ImGuiWindowSettings* self);
ImGuiSettingsHandler* ImGuiSettingsHandler_ImGuiSettingsHandler();
void ImGuiSettingsHandler_destroy(ImGuiSettingsHandler* self);
ImGuiStackLevelInfo* ImGuiStackLevelInfo_ImGuiStackLevelInfo();
void ImGuiStackLevelInfo_destroy(ImGuiStackLevelInfo* self);
ImGuiStackTool* ImGuiStackTool_ImGuiStackTool();
void ImGuiStackTool_destroy(ImGuiStackTool* self);
ImGuiContextHook* ImGuiContextHook_ImGuiContextHook();
void ImGuiContextHook_destroy(ImGuiContextHook* self);
ImGuiContext* ImGuiContext_ImGuiContext(ImFontAtlas* shared_font_atlas);
void ImGuiContext_destroy(ImGuiContext* self);
ImGuiWindow* ImGuiWindow_ImGuiWindow(ImGuiContext* context, const(char)* name);
void ImGuiWindow_destroy(ImGuiWindow* self);
ImGuiID ImGuiWindow_GetID_Str(ImGuiWindow* self, const(char)* str, const(char)* str_end);
ImGuiID ImGuiWindow_GetID_Ptr(ImGuiWindow* self, const(void)* ptr);
ImGuiID ImGuiWindow_GetID_Int(ImGuiWindow* self, int n);
ImGuiID ImGuiWindow_GetIDFromRectangle(ImGuiWindow* self, const ImRect r_abs);
void ImGuiWindow_Rect(ImRect* pOut, ImGuiWindow* self);
float ImGuiWindow_CalcFontSize(ImGuiWindow* self);
float ImGuiWindow_TitleBarHeight(ImGuiWindow* self);
void ImGuiWindow_TitleBarRect(ImRect* pOut, ImGuiWindow* self);
float ImGuiWindow_MenuBarHeight(ImGuiWindow* self);
void ImGuiWindow_MenuBarRect(ImRect* pOut, ImGuiWindow* self);
ImGuiTabItem* ImGuiTabItem_ImGuiTabItem();
void ImGuiTabItem_destroy(ImGuiTabItem* self);
ImGuiTabBar* ImGuiTabBar_ImGuiTabBar();
void ImGuiTabBar_destroy(ImGuiTabBar* self);
ImGuiTableColumn* ImGuiTableColumn_ImGuiTableColumn();
void ImGuiTableColumn_destroy(ImGuiTableColumn* self);
ImGuiTableInstanceData* ImGuiTableInstanceData_ImGuiTableInstanceData();
void ImGuiTableInstanceData_destroy(ImGuiTableInstanceData* self);
ImGuiTable* ImGuiTable_ImGuiTable();
void ImGuiTable_destroy(ImGuiTable* self);
ImGuiTableTempData* ImGuiTableTempData_ImGuiTableTempData();
void ImGuiTableTempData_destroy(ImGuiTableTempData* self);
ImGuiTableColumnSettings* ImGuiTableColumnSettings_ImGuiTableColumnSettings();
void ImGuiTableColumnSettings_destroy(ImGuiTableColumnSettings* self);
ImGuiTableSettings* ImGuiTableSettings_ImGuiTableSettings();
void ImGuiTableSettings_destroy(ImGuiTableSettings* self);
ImGuiTableColumnSettings* ImGuiTableSettings_GetColumnSettings(ImGuiTableSettings* self);
ImGuiWindow* igGetCurrentWindowRead();
ImGuiWindow* igGetCurrentWindow();
ImGuiWindow* igFindWindowByID(ImGuiID id);
ImGuiWindow* igFindWindowByName(const(char)* name);
void igUpdateWindowParentAndRootLinks(ImGuiWindow* window,
        ImGuiWindowFlags flags, ImGuiWindow* parent_window);
void igCalcWindowNextAutoFitSize(ImVec2* pOut, ImGuiWindow* window);
bool igIsWindowChildOf(ImGuiWindow* window, ImGuiWindow* potential_parent, bool popup_hierarchy);
bool igIsWindowWithinBeginStackOf(ImGuiWindow* window, ImGuiWindow* potential_parent);
bool igIsWindowAbove(ImGuiWindow* potential_above, ImGuiWindow* potential_below);
bool igIsWindowNavFocusable(ImGuiWindow* window);
void igSetWindowPos_WindowPtr(ImGuiWindow* window, const ImVec2 pos, ImGuiCond cond);
void igSetWindowSize_WindowPtr(ImGuiWindow* window, const ImVec2 size, ImGuiCond cond);
void igSetWindowCollapsed_WindowPtr(ImGuiWindow* window, bool collapsed, ImGuiCond cond);
void igSetWindowHitTestHole(ImGuiWindow* window, const ImVec2 pos, const ImVec2 size);
void igSetWindowHiddendAndSkipItemsForCurrentFrame(ImGuiWindow* window);
void igWindowRectAbsToRel(ImRect* pOut, ImGuiWindow* window, const ImRect r);
void igWindowRectRelToAbs(ImRect* pOut, ImGuiWindow* window, const ImRect r);
void igWindowPosRelToAbs(ImVec2* pOut, ImGuiWindow* window, const ImVec2 p);
void igFocusWindow(ImGuiWindow* window, ImGuiFocusRequestFlags flags);
void igFocusTopMostWindowUnderOne(ImGuiWindow* under_this_window,
        ImGuiWindow* ignore_window, ImGuiViewport* filter_viewport, ImGuiFocusRequestFlags flags);
void igBringWindowToFocusFront(ImGuiWindow* window);
void igBringWindowToDisplayFront(ImGuiWindow* window);
void igBringWindowToDisplayBack(ImGuiWindow* window);
void igBringWindowToDisplayBehind(ImGuiWindow* window, ImGuiWindow* above_window);
int igFindWindowDisplayIndex(ImGuiWindow* window);
ImGuiWindow* igFindBottomMostVisibleWindowWithinBeginStack(ImGuiWindow* window);
void igSetCurrentFont(ImFont* font);
ImFont* igGetDefaultFont();
ImDrawList* igGetForegroundDrawList_WindowPtr(ImGuiWindow* window);
ImDrawList* igGetBackgroundDrawList_ViewportPtr(ImGuiViewport* viewport);
ImDrawList* igGetForegroundDrawList_ViewportPtr(ImGuiViewport* viewport);
void igAddDrawListToDrawDataEx(ImDrawData* draw_data,
        ImVector_ImDrawListPtr* out_list, ImDrawList* draw_list);
void igInitialize();
void igShutdown();
void igUpdateInputEvents(bool trickle_fast_inputs);
void igUpdateHoveredWindowAndCaptureFlags();
void igStartMouseMovingWindow(ImGuiWindow* window);
void igUpdateMouseMovingWindowNewFrame();
void igUpdateMouseMovingWindowEndFrame();
ImGuiID igAddContextHook(ImGuiContext* context, const(ImGuiContextHook)* hook);
void igRemoveContextHook(ImGuiContext* context, ImGuiID hook_to_remove);
void igCallContextHooks(ImGuiContext* context, ImGuiContextHookType type);
void igSetWindowViewport(ImGuiWindow* window, ImGuiViewportP* viewport);
void igMarkIniSettingsDirty_Nil();
void igMarkIniSettingsDirty_WindowPtr(ImGuiWindow* window);
void igClearIniSettings();
void igAddSettingsHandler(const(ImGuiSettingsHandler)* handler);
void igRemoveSettingsHandler(const(char)* type_name);
ImGuiSettingsHandler* igFindSettingsHandler(const(char)* type_name);
ImGuiWindowSettings* igCreateNewWindowSettings(const(char)* name);
ImGuiWindowSettings* igFindWindowSettingsByID(ImGuiID id);
ImGuiWindowSettings* igFindWindowSettingsByWindow(ImGuiWindow* window);
void igClearWindowSettings(const(char)* name);
void igLocalizeRegisterEntries(const(ImGuiLocEntry)* entries, int count);
const(char)* igLocalizeGetMsg(ImGuiLocKey key);
void igSetScrollX_WindowPtr(ImGuiWindow* window, float scroll_x);
void igSetScrollY_WindowPtr(ImGuiWindow* window, float scroll_y);
void igSetScrollFromPosX_WindowPtr(ImGuiWindow* window, float local_x, float center_x_ratio);
void igSetScrollFromPosY_WindowPtr(ImGuiWindow* window, float local_y, float center_y_ratio);
void igScrollToItem(ImGuiScrollFlags flags);
void igScrollToRect(ImGuiWindow* window, const ImRect rect, ImGuiScrollFlags flags);
void igScrollToRectEx(ImVec2* pOut, ImGuiWindow* window, const ImRect rect, ImGuiScrollFlags flags);
void igScrollToBringRectIntoView(ImGuiWindow* window, const ImRect rect);
ImGuiItemStatusFlags igGetItemStatusFlags();
ImGuiItemFlags igGetItemFlags();
ImGuiID igGetActiveID();
ImGuiID igGetFocusID();
void igSetActiveID(ImGuiID id, ImGuiWindow* window);
void igSetFocusID(ImGuiID id, ImGuiWindow* window);
void igClearActiveID();
ImGuiID igGetHoveredID();
void igSetHoveredID(ImGuiID id);
void igKeepAliveID(ImGuiID id);
void igMarkItemEdited(ImGuiID id);
void igPushOverrideID(ImGuiID id);
ImGuiID igGetIDWithSeed_Str(const(char)* str_id_begin, const(char)* str_id_end, ImGuiID seed);
ImGuiID igGetIDWithSeed_Int(int n, ImGuiID seed);
void igItemSize_Vec2(const ImVec2 size, float text_baseline_y);
void igItemSize_Rect(const ImRect bb, float text_baseline_y);
bool igItemAdd(const ImRect bb, ImGuiID id, const(ImRect)* nav_bb, ImGuiItemFlags extra_flags);
bool igItemHoverable(const ImRect bb, ImGuiID id, ImGuiItemFlags item_flags);
bool igIsWindowContentHoverable(ImGuiWindow* window, ImGuiHoveredFlags flags);
bool igIsClippedEx(const ImRect bb, ImGuiID id);
void igSetLastItemData(ImGuiID item_id, ImGuiItemFlags in_flags,
        ImGuiItemStatusFlags status_flags, const ImRect item_rect);
void igCalcItemSize(ImVec2* pOut, ImVec2 size, float default_w, float default_h);
float igCalcWrapWidthForPos(const ImVec2 pos, float wrap_pos_x);
void igPushMultiItemsWidths(int components, float width_full);
bool igIsItemToggledSelection();
void igGetContentRegionMaxAbs(ImVec2* pOut);
void igShrinkWidths(ImGuiShrinkWidthItem* items, int count, float width_excess);
void igPushItemFlag(ImGuiItemFlags option, bool enabled);
void igPopItemFlag();
const(ImGuiDataVarInfo)* igGetStyleVarInfo(ImGuiStyleVar idx);
void igLogBegin(ImGuiLogType type, int auto_open_depth);
void igLogToBuffer(int auto_open_depth);
void igLogRenderedText(const(ImVec2)* ref_pos, const(char)* text, const(char)* text_end);
void igLogSetNextTextDecoration(const(char)* prefix, const(char)* suffix);
bool igBeginChildEx(const(char)* name, ImGuiID id, const ImVec2 size_arg,
        bool border, ImGuiWindowFlags flags);
void igOpenPopupEx(ImGuiID id, ImGuiPopupFlags popup_flags);
void igClosePopupToLevel(int remaining, bool restore_focus_to_window_under_popup);
void igClosePopupsOverWindow(ImGuiWindow* ref_window, bool restore_focus_to_window_under_popup);
void igClosePopupsExceptModals();
bool igIsPopupOpen_ID(ImGuiID id, ImGuiPopupFlags popup_flags);
bool igBeginPopupEx(ImGuiID id, ImGuiWindowFlags extra_flags);
bool igBeginTooltipEx(ImGuiTooltipFlags tooltip_flags, ImGuiWindowFlags extra_window_flags);
void igGetPopupAllowedExtentRect(ImRect* pOut, ImGuiWindow* window);
ImGuiWindow* igGetTopMostPopupModal();
ImGuiWindow* igGetTopMostAndVisiblePopupModal();
ImGuiWindow* igFindBlockingModal(ImGuiWindow* window);
void igFindBestWindowPosForPopup(ImVec2* pOut, ImGuiWindow* window);
void igFindBestWindowPosForPopupEx(ImVec2* pOut, const ImVec2 ref_pos, const ImVec2 size,
        ImGuiDir* last_dir, const ImRect r_outer, const ImRect r_avoid,
        ImGuiPopupPositionPolicy policy);
bool igBeginViewportSideBar(const(char)* name, ImGuiViewport* viewport,
        ImGuiDir dir, float size, ImGuiWindowFlags window_flags);
bool igBeginMenuEx(const(char)* label, const(char)* icon, bool enabled);
bool igMenuItemEx(const(char)* label, const(char)* icon, const(char)* shortcut,
        bool selected, bool enabled);
bool igBeginComboPopup(ImGuiID popup_id, const ImRect bb, ImGuiComboFlags flags);
bool igBeginComboPreview();
void igEndComboPreview();
void igNavInitWindow(ImGuiWindow* window, bool force_reinit);
void igNavInitRequestApplyResult();
bool igNavMoveRequestButNoResultYet();
void igNavMoveRequestSubmit(ImGuiDir move_dir, ImGuiDir clip_dir,
        ImGuiNavMoveFlags move_flags, ImGuiScrollFlags scroll_flags);
void igNavMoveRequestForward(ImGuiDir move_dir, ImGuiDir clip_dir,
        ImGuiNavMoveFlags move_flags, ImGuiScrollFlags scroll_flags);
void igNavMoveRequestResolveWithLastItem(ImGuiNavItemData* result);
void igNavMoveRequestResolveWithPastTreeNode(ImGuiNavItemData* result,
        ImGuiNavTreeNodeData* tree_node_data);
void igNavMoveRequestCancel();
void igNavMoveRequestApplyResult();
void igNavMoveRequestTryWrapping(ImGuiWindow* window, ImGuiNavMoveFlags move_flags);
void igNavClearPreferredPosForAxis(ImGuiAxis axis);
void igNavUpdateCurrentWindowIsScrollPushableX();
void igSetNavWindow(ImGuiWindow* window);
void igSetNavID(ImGuiID id, ImGuiNavLayer nav_layer, ImGuiID focus_scope_id, const ImRect rect_rel);
void igFocusItem();
void igActivateItemByID(ImGuiID id);
bool igIsNamedKey(ImGuiKey key);
bool igIsNamedKeyOrModKey(ImGuiKey key);
bool igIsLegacyKey(ImGuiKey key);
bool igIsKeyboardKey(ImGuiKey key);
bool igIsGamepadKey(ImGuiKey key);
bool igIsMouseKey(ImGuiKey key);
bool igIsAliasKey(ImGuiKey key);
ImGuiKeyChord igConvertShortcutMod(ImGuiKeyChord key_chord);
ImGuiKey igConvertSingleModFlagToKey(ImGuiContext* ctx, ImGuiKey key);
ImGuiKeyData* igGetKeyData_ContextPtr(ImGuiContext* ctx, ImGuiKey key);
ImGuiKeyData* igGetKeyData_Key(ImGuiKey key);
void igGetKeyChordName(ImGuiKeyChord key_chord, char* out_buf, int out_buf_size);
ImGuiKey igMouseButtonToKey(ImGuiMouseButton button);
bool igIsMouseDragPastThreshold(ImGuiMouseButton button, float lock_threshold);
void igGetKeyMagnitude2d(ImVec2* pOut, ImGuiKey key_left, ImGuiKey key_right,
        ImGuiKey key_up, ImGuiKey key_down);
float igGetNavTweakPressedAmount(ImGuiAxis axis);
int igCalcTypematicRepeatAmount(float t0, float t1, float repeat_delay, float repeat_rate);
void igGetTypematicRepeatRate(ImGuiInputFlags flags, float* repeat_delay, float* repeat_rate);
void igSetActiveIdUsingAllKeyboardKeys();
bool igIsActiveIdUsingNavDir(ImGuiDir dir);
ImGuiID igGetKeyOwner(ImGuiKey key);
void igSetKeyOwner(ImGuiKey key, ImGuiID owner_id, ImGuiInputFlags flags);
void igSetKeyOwnersForKeyChord(ImGuiKeyChord key, ImGuiID owner_id, ImGuiInputFlags flags);
void igSetItemKeyOwner(ImGuiKey key, ImGuiInputFlags flags);
bool igTestKeyOwner(ImGuiKey key, ImGuiID owner_id);
ImGuiKeyOwnerData* igGetKeyOwnerData(ImGuiContext* ctx, ImGuiKey key);
bool igIsKeyDown_ID(ImGuiKey key, ImGuiID owner_id);
bool igIsKeyPressed_ID(ImGuiKey key, ImGuiID owner_id, ImGuiInputFlags flags);
bool igIsKeyReleased_ID(ImGuiKey key, ImGuiID owner_id);
bool igIsMouseDown_ID(ImGuiMouseButton button, ImGuiID owner_id);
bool igIsMouseClicked_ID(ImGuiMouseButton button, ImGuiID owner_id, ImGuiInputFlags flags);
bool igIsMouseReleased_ID(ImGuiMouseButton button, ImGuiID owner_id);
bool igShortcut(ImGuiKeyChord key_chord, ImGuiID owner_id, ImGuiInputFlags flags);
bool igSetShortcutRouting(ImGuiKeyChord key_chord, ImGuiID owner_id, ImGuiInputFlags flags);
bool igTestShortcutRouting(ImGuiKeyChord key_chord, ImGuiID owner_id);
ImGuiKeyRoutingData* igGetShortcutRoutingData(ImGuiKeyChord key_chord);
void igPushFocusScope(ImGuiID id);
void igPopFocusScope();
ImGuiID igGetCurrentFocusScope();
bool igIsDragDropActive();
bool igBeginDragDropTargetCustom(const ImRect bb, ImGuiID id);
void igClearDragDrop();
bool igIsDragDropPayloadBeingAccepted();
void igRenderDragDropTargetRect(const ImRect bb);
void igSetWindowClipRectBeforeSetChannel(ImGuiWindow* window, const ImRect clip_rect);
void igBeginColumns(const(char)* str_id, int count, ImGuiOldColumnFlags flags);
void igEndColumns();
void igPushColumnClipRect(int column_index);
void igPushColumnsBackground();
void igPopColumnsBackground();
ImGuiID igGetColumnsID(const(char)* str_id, int count);
ImGuiOldColumns* igFindOrCreateColumns(ImGuiWindow* window, ImGuiID id);
float igGetColumnOffsetFromNorm(const(ImGuiOldColumns)* columns, float offset_norm);
float igGetColumnNormFromOffset(const(ImGuiOldColumns)* columns, float offset);
void igTableOpenContextMenu(int column_n);
void igTableSetColumnWidth(int column_n, float width);
void igTableSetColumnSortDirection(int column_n,
        ImGuiSortDirection sort_direction, bool append_to_sort_specs);
int igTableGetHoveredColumn();
int igTableGetHoveredRow();
float igTableGetHeaderRowHeight();
void igTablePushBackgroundChannel();
void igTablePopBackgroundChannel();
ImGuiTable* igGetCurrentTable();
ImGuiTable* igTableFindByID(ImGuiID id);
bool igBeginTableEx(const(char)* name, ImGuiID id, int columns_count,
        ImGuiTableFlags flags, const ImVec2 outer_size, float inner_width);
void igTableBeginInitMemory(ImGuiTable* table, int columns_count);
void igTableBeginApplyRequests(ImGuiTable* table);
void igTableSetupDrawChannels(ImGuiTable* table);
void igTableUpdateLayout(ImGuiTable* table);
void igTableUpdateBorders(ImGuiTable* table);
void igTableUpdateColumnsWeightFromWidth(ImGuiTable* table);
void igTableDrawBorders(ImGuiTable* table);
void igTableDrawContextMenu(ImGuiTable* table);
bool igTableBeginContextMenuPopup(ImGuiTable* table);
void igTableMergeDrawChannels(ImGuiTable* table);
ImGuiTableInstanceData* igTableGetInstanceData(ImGuiTable* table, int instance_no);
ImGuiID igTableGetInstanceID(ImGuiTable* table, int instance_no);
void igTableSortSpecsSanitize(ImGuiTable* table);
void igTableSortSpecsBuild(ImGuiTable* table);
ImGuiSortDirection igTableGetColumnNextSortDirection(ImGuiTableColumn* column);
void igTableFixColumnSortDirection(ImGuiTable* table, ImGuiTableColumn* column);
float igTableGetColumnWidthAuto(ImGuiTable* table, ImGuiTableColumn* column);
void igTableBeginRow(ImGuiTable* table);
void igTableEndRow(ImGuiTable* table);
void igTableBeginCell(ImGuiTable* table, int column_n);
void igTableEndCell(ImGuiTable* table);
void igTableGetCellBgRect(ImRect* pOut, const(ImGuiTable)* table, int column_n);
const(char)* igTableGetColumnName_TablePtr(const(ImGuiTable)* table, int column_n);
ImGuiID igTableGetColumnResizeID(ImGuiTable* table, int column_n, int instance_no);
float igTableGetMaxColumnWidth(const(ImGuiTable)* table, int column_n);
void igTableSetColumnWidthAutoSingle(ImGuiTable* table, int column_n);
void igTableSetColumnWidthAutoAll(ImGuiTable* table);
void igTableRemove(ImGuiTable* table);
void igTableGcCompactTransientBuffers_TablePtr(ImGuiTable* table);
void igTableGcCompactTransientBuffers_TableTempDataPtr(ImGuiTableTempData* table);
void igTableGcCompactSettings();
void igTableLoadSettings(ImGuiTable* table);
void igTableSaveSettings(ImGuiTable* table);
void igTableResetSettings(ImGuiTable* table);
ImGuiTableSettings* igTableGetBoundSettings(ImGuiTable* table);
void igTableSettingsAddSettingsHandler();
ImGuiTableSettings* igTableSettingsCreate(ImGuiID id, int columns_count);
ImGuiTableSettings* igTableSettingsFindByID(ImGuiID id);
ImGuiTabBar* igGetCurrentTabBar();
bool igBeginTabBarEx(ImGuiTabBar* tab_bar, const ImRect bb, ImGuiTabBarFlags flags);
ImGuiTabItem* igTabBarFindTabByID(ImGuiTabBar* tab_bar, ImGuiID tab_id);
ImGuiTabItem* igTabBarFindTabByOrder(ImGuiTabBar* tab_bar, int order);
ImGuiTabItem* igTabBarGetCurrentTab(ImGuiTabBar* tab_bar);
int igTabBarGetTabOrder(ImGuiTabBar* tab_bar, ImGuiTabItem* tab);
const(char)* igTabBarGetTabName(ImGuiTabBar* tab_bar, ImGuiTabItem* tab);
void igTabBarRemoveTab(ImGuiTabBar* tab_bar, ImGuiID tab_id);
void igTabBarCloseTab(ImGuiTabBar* tab_bar, ImGuiTabItem* tab);
void igTabBarQueueFocus(ImGuiTabBar* tab_bar, ImGuiTabItem* tab);
void igTabBarQueueReorder(ImGuiTabBar* tab_bar, ImGuiTabItem* tab, int offset);
void igTabBarQueueReorderFromMousePos(ImGuiTabBar* tab_bar, ImGuiTabItem* tab, ImVec2 mouse_pos);
bool igTabBarProcessReorder(ImGuiTabBar* tab_bar);
bool igTabItemEx(ImGuiTabBar* tab_bar, const(char)* label, bool* p_open,
        ImGuiTabItemFlags flags, ImGuiWindow* docked_window);
void igTabItemCalcSize_Str(ImVec2* pOut, const(char)* label,
        bool has_close_button_or_unsaved_marker);
void igTabItemCalcSize_WindowPtr(ImVec2* pOut, ImGuiWindow* window);
void igTabItemBackground(ImDrawList* draw_list, const ImRect bb, ImGuiTabItemFlags flags, ImU32 col);
void igTabItemLabelAndCloseButton(ImDrawList* draw_list, const ImRect bb, ImGuiTabItemFlags flags, ImVec2 frame_padding,
        const(char)* label, ImGuiID tab_id, ImGuiID close_button_id,
        bool is_contents_visible, bool* out_just_closed, bool* out_text_clipped);
void igRenderText(ImVec2 pos, const(char)* text, const(char)* text_end, bool hide_text_after_hash);
void igRenderTextWrapped(ImVec2 pos, const(char)* text, const(char)* text_end, float wrap_width);
void igRenderTextClipped(const ImVec2 pos_min, const ImVec2 pos_max, const(char)* text,
        const(char)* text_end, const(ImVec2)* text_size_if_known,
        const ImVec2 align_, const(ImRect)* clip_rect);
void igRenderTextClippedEx(ImDrawList* draw_list, const ImVec2 pos_min,
        const ImVec2 pos_max, const(char)* text, const(char)* text_end,
        const(ImVec2)* text_size_if_known, const ImVec2 align_, const(ImRect)* clip_rect);
void igRenderTextEllipsis(ImDrawList* draw_list, const ImVec2 pos_min, const ImVec2 pos_max,
        float clip_max_x, float ellipsis_max_x, const(char)* text,
        const(char)* text_end, const(ImVec2)* text_size_if_known);
void igRenderFrame(ImVec2 p_min, ImVec2 p_max, ImU32 fill_col, bool border, float rounding);
void igRenderFrameBorder(ImVec2 p_min, ImVec2 p_max, float rounding);
void igRenderColorRectWithAlphaCheckerboard(ImDrawList* draw_list, ImVec2 p_min, ImVec2 p_max,
        ImU32 fill_col, float grid_step, ImVec2 grid_off, float rounding, ImDrawFlags flags);
void igRenderNavHighlight(const ImRect bb, ImGuiID id, ImGuiNavHighlightFlags flags);
const(char)* igFindRenderedTextEnd(const(char)* text, const(char)* text_end);
void igRenderMouseCursor(ImVec2 pos, float scale, ImGuiMouseCursor mouse_cursor,
        ImU32 col_fill, ImU32 col_border, ImU32 col_shadow);
void igRenderArrow(ImDrawList* draw_list, ImVec2 pos, ImU32 col, ImGuiDir dir, float scale);
void igRenderBullet(ImDrawList* draw_list, ImVec2 pos, ImU32 col);
void igRenderCheckMark(ImDrawList* draw_list, ImVec2 pos, ImU32 col, float sz);
void igRenderArrowPointingAt(ImDrawList* draw_list, ImVec2 pos, ImVec2 half_sz,
        ImGuiDir direction, ImU32 col);
void igRenderRectFilledRangeH(ImDrawList* draw_list, const ImRect rect, ImU32 col,
        float x_start_norm, float x_end_norm, float rounding);
void igRenderRectFilledWithHole(ImDrawList* draw_list, const ImRect outer,
        const ImRect inner, ImU32 col, float rounding);
void igTextEx(const(char)* text, const(char)* text_end, ImGuiTextFlags flags);
bool igButtonEx(const(char)* label, const ImVec2 size_arg, ImGuiButtonFlags flags);
bool igArrowButtonEx(const(char)* str_id, ImGuiDir dir, ImVec2 size_arg, ImGuiButtonFlags flags);
bool igImageButtonEx(ImGuiID id, ImTextureID texture_id, const ImVec2 size, const ImVec2 uv0,
        const ImVec2 uv1, const ImVec4 bg_col, const ImVec4 tint_col, ImGuiButtonFlags flags);
void igSeparatorEx(ImGuiSeparatorFlags flags, float thickness);
void igSeparatorTextEx(ImGuiID id, const(char)* label, const(char)* label_end, float extra_width);
bool igCheckboxFlags_S64Ptr(const(char)* label, ImS64* flags, ImS64 flags_value);
bool igCheckboxFlags_U64Ptr(const(char)* label, ImU64* flags, ImU64 flags_value);
bool igCloseButton(ImGuiID id, const ImVec2 pos);
bool igCollapseButton(ImGuiID id, const ImVec2 pos);
void igScrollbar(ImGuiAxis axis);
bool igScrollbarEx(const ImRect bb, ImGuiID id, ImGuiAxis axis, ImS64* p_scroll_v,
        ImS64 avail_v, ImS64 contents_v, ImDrawFlags flags);
void igGetWindowScrollbarRect(ImRect* pOut, ImGuiWindow* window, ImGuiAxis axis);
ImGuiID igGetWindowScrollbarID(ImGuiWindow* window, ImGuiAxis axis);
ImGuiID igGetWindowResizeCornerID(ImGuiWindow* window, int n);
ImGuiID igGetWindowResizeBorderID(ImGuiWindow* window, ImGuiDir dir);
bool igButtonBehavior(const ImRect bb, ImGuiID id, bool* out_hovered,
        bool* out_held, ImGuiButtonFlags flags);
bool igDragBehavior(ImGuiID id, ImGuiDataType data_type, void* p_v, float v_speed,
        const(void)* p_min, const(void)* p_max, const(char)* format, ImGuiSliderFlags flags);
bool igSliderBehavior(const ImRect bb, ImGuiID id, ImGuiDataType data_type,
        void* p_v, const(void)* p_min, const(void)* p_max, const(char)* format,
        ImGuiSliderFlags flags, ImRect* out_grab_bb);
bool igSplitterBehavior(const ImRect bb, ImGuiID id, ImGuiAxis axis, float* size1, float* size2,
        float min_size1, float min_size2, float hover_extend,
        float hover_visibility_delay, ImU32 bg_col);
bool igTreeNodeBehavior(ImGuiID id, ImGuiTreeNodeFlags flags, const(char)* label,
        const(char)* label_end);
void igTreePushOverrideID(ImGuiID id);
void igTreeNodeSetOpen(ImGuiID id, bool open);
bool igTreeNodeUpdateNextOpen(ImGuiID id, ImGuiTreeNodeFlags flags);
const(ImGuiDataTypeInfo)* igDataTypeGetInfo(ImGuiDataType data_type);
int igDataTypeFormatString(char* buf, int buf_size, ImGuiDataType data_type,
        const(void)* p_data, const(char)* format);
void igDataTypeApplyOp(ImGuiDataType data_type, int op, void* output,
        const(void)* arg_1, const(void)* arg_2);
bool igDataTypeApplyFromText(const(char)* buf, ImGuiDataType data_type,
        void* p_data, const(char)* format);
int igDataTypeCompare(ImGuiDataType data_type, const(void)* arg_1, const(void)* arg_2);
bool igDataTypeClamp(ImGuiDataType data_type, void* p_data,
        const(void)* p_min, const(void)* p_max);
bool igInputTextEx(const(char)* label, const(char)* hint, char* buf, int buf_size,
        const ImVec2 size_arg, ImGuiInputTextFlags flags,
        ImGuiInputTextCallback callback, void* user_data);
void igInputTextDeactivateHook(ImGuiID id);
bool igTempInputText(const ImRect bb, ImGuiID id, const(char)* label, char* buf,
        int buf_size, ImGuiInputTextFlags flags);
bool igTempInputScalar(const ImRect bb, ImGuiID id, const(char)* label,
        ImGuiDataType data_type, void* p_data, const(char)* format,
        const(void)* p_clamp_min, const(void)* p_clamp_max);
bool igTempInputIsActive(ImGuiID id);
ImGuiInputTextState* igGetInputTextState(ImGuiID id);
void igColorTooltip(const(char)* text, const(float)* col, ImGuiColorEditFlags flags);
void igColorEditOptionsPopup(const(float)* col, ImGuiColorEditFlags flags);
void igColorPickerOptionsPopup(const(float)* ref_col, ImGuiColorEditFlags flags);
int igPlotEx(ImGuiPlotType plot_type, const(char)* label, float function(void* data,
        int idx) values_getter, void* data, int values_count, int values_offset,
        const(char)* overlay_text, float scale_min, float scale_max, const ImVec2 size_arg);
void igShadeVertsLinearColorGradientKeepAlpha(ImDrawList* draw_list, int vert_start_idx,
        int vert_end_idx, ImVec2 gradient_p0, ImVec2 gradient_p1, ImU32 col0, ImU32 col1);
void igShadeVertsLinearUV(ImDrawList* draw_list, int vert_start_idx, int vert_end_idx,
        const ImVec2 a, const ImVec2 b, const ImVec2 uv_a, const ImVec2 uv_b, bool clamp);
void igGcCompactTransientMiscBuffers();
void igGcCompactTransientWindowBuffers(ImGuiWindow* window);
void igGcAwakeTransientWindowBuffers(ImGuiWindow* window);
void igDebugLog(const(char)* fmt, ...);
void igDebugLogV(const(char)* fmt, va_list args);
void igErrorCheckEndFrameRecover(ImGuiErrorLogCallback log_callback, void* user_data);
void igErrorCheckEndWindowRecover(ImGuiErrorLogCallback log_callback, void* user_data);
void igErrorCheckUsingSetCursorPosToExtendParentBoundaries();
void igDebugDrawCursorPos(ImU32 col);
void igDebugDrawLineExtents(ImU32 col);
void igDebugDrawItemRect(ImU32 col);
void igDebugLocateItem(ImGuiID target_id);
void igDebugLocateItemOnHover(ImGuiID target_id);
void igDebugLocateItemResolveWithLastItem();
void igDebugStartItemPicker();
void igShowFontAtlas(ImFontAtlas* atlas);
void igDebugHookIdInfo(ImGuiID id, ImGuiDataType data_type, const(void)* data_id,
        const(void)* data_id_end);
void igDebugNodeColumns(ImGuiOldColumns* columns);
void igDebugNodeDrawList(ImGuiWindow* window, ImGuiViewportP* viewport,
        const(ImDrawList)* draw_list, const(char)* label);
void igDebugNodeDrawCmdShowMeshAndBoundingBox(ImDrawList* out_draw_list,
        const(ImDrawList)* draw_list, const(ImDrawCmd)* draw_cmd, bool show_mesh, bool show_aabb);
void igDebugNodeFont(ImFont* font);
void igDebugNodeFontGlyph(ImFont* font, const(ImFontGlyph)* glyph);
void igDebugNodeStorage(ImGuiStorage* storage, const(char)* label);
void igDebugNodeTabBar(ImGuiTabBar* tab_bar, const(char)* label);
void igDebugNodeTable(ImGuiTable* table);
void igDebugNodeTableSettings(ImGuiTableSettings* settings);
void igDebugNodeInputTextState(ImGuiInputTextState* state);
void igDebugNodeWindow(ImGuiWindow* window, const(char)* label);
void igDebugNodeWindowSettings(ImGuiWindowSettings* settings);
void igDebugNodeWindowsList(ImVector_ImGuiWindowPtr* windows, const(char)* label);
void igDebugNodeWindowsListByBeginStackParent(ImGuiWindow** windows,
        int windows_size, ImGuiWindow* parent_in_begin_stack);
void igDebugNodeViewport(ImGuiViewportP* viewport);
void igDebugRenderKeyboardPreview(ImDrawList* draw_list);
void igDebugRenderViewportThumbnail(ImDrawList* draw_list, ImGuiViewportP* viewport, const ImRect bb);
bool igIsKeyPressedMap(ImGuiKey key, bool repeat);
const(ImFontBuilderIO)* igImFontAtlasGetBuilderForStbTruetype();
void igImFontAtlasBuildInit(ImFontAtlas* atlas);
void igImFontAtlasBuildSetupFont(ImFontAtlas* atlas, ImFont* font,
        ImFontConfig* font_config, float ascent, float descent);
void igImFontAtlasBuildPackCustomRects(ImFontAtlas* atlas, void* stbrp_context_opaque);
void igImFontAtlasBuildFinish(ImFontAtlas* atlas);
void igImFontAtlasBuildRender8bppRectFromString(ImFontAtlas* atlas, int x, int y,
        int w, int h, const(char)* in_str, char in_marker_char, ubyte in_marker_pixel_value);
void igImFontAtlasBuildRender32bppRectFromString(ImFontAtlas* atlas, int x, int y,
        int w, int h, const(char)* in_str, char in_marker_char, uint in_marker_pixel_value);
void igImFontAtlasBuildMultiplyCalcLookupTable(ref ubyte[256] out_table, float in_multiply_factor);
void igImFontAtlasBuildMultiplyRectAlpha8(ref const(ubyte)[256] table,
        ubyte* pixels, int x, int y, int w, int h, int stride);
void igLogText(const(char)* fmt, ...);
void ImGuiTextBuffer_appendf(ImGuiTextBuffer* buffer, const(char)* fmt, ...);
float igGET_FLT_MAX();
float igGET_FLT_MIN();
ImVector_ImWchar* ImVector_ImWchar_create();
void ImVector_ImWchar_destroy(ImVector_ImWchar* self);
void ImVector_ImWchar_Init(ImVector_ImWchar* p);
void ImVector_ImWchar_UnInit(ImVector_ImWchar* p);
enum SIMGUI_INVALID_ID = 0;
struct simgui_image_t
{
    uint id;
}

struct simgui_image_desc_t
{
    sg.Image image;
    sg.Sampler sampler;
}

enum simgui_log_item_t
{
    SIMGUI_LOGITEM_OK = 0,
    SIMGUI_LOGITEM_MALLOC_FAILED = 1,
    SIMGUI_LOGITEM_IMAGE_POOL_EXHAUSTED = 2
}

struct simgui_allocator_t
{
    void* function(size_t size, void* user_data) alloc_fn;
    void function(void* ptr, void* user_data) free_fn;
    void* user_data;
}

struct simgui_logger_t
{
    void function(const(char)* tag, uint log_level, uint log_item_id,
            const(char)* message_or_null, uint line_nr,
            const(char)* filename_or_null, void* user_data) func;
    void* user_data;
}

struct simgui_desc_t
{
    int max_vertices;
    int image_pool_size;
    sg.PixelFormat color_format;
    sg.PixelFormat depth_format;
    int sample_count;
    const(char)* ini_filename;
    bool no_default_font;
    bool disable_paste_override;
    bool disable_set_mouse_cursor;
    bool disable_windows_resize_from_edges;
    bool write_alpha_channel;
    simgui_allocator_t allocator;
    simgui_logger_t logger;
}

struct simgui_frame_desc_t
{
    int width;
    int height;
    double delta_time;
    float dpi_scale;
}

void simgui_setup(const(simgui_desc_t)* desc);
void simgui_new_frame(const(simgui_frame_desc_t)* desc);
void simgui_render();
simgui_image_t simgui_make_image(const(simgui_image_desc_t)* desc);
void simgui_destroy_image(simgui_image_t img);
simgui_image_desc_t simgui_query_image_desc(simgui_image_t img);
void* simgui_imtextureid(simgui_image_t img);
simgui_image_t simgui_image_from_imtextureid(void* imtextureid);
void simgui_add_focus_event(bool focus);
void simgui_add_mouse_pos_event(float x, float y);
void simgui_add_touch_pos_event(float x, float y);
void simgui_add_mouse_button_event(int mouse_button, bool down);
void simgui_add_mouse_wheel_event(float wheel_x, float wheel_y);
void simgui_add_key_event(int function(int) map_keycode, int keycode, bool down);
void simgui_add_input_character(uint c);
void simgui_add_input_characters_utf8(const(char)* c);
void simgui_add_touch_button_event(int mouse_button, bool down);
bool simgui_handle_event(const(sapp.Event)* ev);
int simgui_map_keycode(sapp.Keycode keycode);
void simgui_shutdown();
struct _simgui_vs_params_t
{
    ImVec2 disp_size;
    ubyte[8] _pad_8;
}

enum _simgui_resource_state
{
    _SIMGUI_RESOURCESTATE_INITIAL = 0,
    _SIMGUI_RESOURCESTATE_ALLOC = 1,
    _SIMGUI_RESOURCESTATE_VALID = 2,
    _SIMGUI_RESOURCESTATE_FAILED = 3,
    _SIMGUI_RESOURCESTATE_INVALID = 4,
    _SIMGUI_RESOURCESTATE_FORCE_U32 = 0x7FFFFFFF
}

struct _simgui_slot_t
{
    uint id;
    _simgui_resource_state state;
}

struct _simgui_pool_t
{
    int size;
    int queue_top;
    uint* gen_ctrs;
    int* free_queue;
}

struct _simgui_image_t
{
    _simgui_slot_t slot;
    sg.Image image;
    sg.Sampler sampler;
    sg.Pipeline pip;
}

struct _simgui_image_pool_t
{
    _simgui_pool_t pool;
    _simgui_image_t* items;
}

struct _simgui_state_t
{
    uint init_cookie;
    simgui_desc_t desc;
    float cur_dpi_scale;
    sg.Buffer vbuf;
    sg.Buffer ibuf;
    sg.Image font_img;
    sg.Sampler font_smp;
    simgui_image_t default_font;
    sg.Image def_img;
    sg.Sampler def_smp;
    sg.Shader def_shd;
    sg.Pipeline def_pip;

    sg.Shader shd_unfilterable;
    sg.Pipeline pip_unfilterable;
    sg.Range vertices;
    sg.Range indices;
    bool is_osx;
    _simgui_image_pool_t image_pool;
}

extern __gshared _simgui_state_t _simgui;
extern __gshared const(char)[341] _simgui_vs_source_glsl330;
extern __gshared const(char)[177] _simgui_fs_source_glsl330;

void _simgui_set_clipboard(void* user_data, const(char)* text);
const(char)* _simgui_get_clipboard(void* user_data);

extern __gshared const(char)*[3] _simgui_log_messages;

void _simgui_log(simgui_log_item_t log_item, uint log_level, const(char)* msg, uint line_nr);
void _simgui_clear(void* ptr, size_t size);
void* _simgui_malloc(size_t size);
void* _simgui_malloc_clear(size_t size);
void _simgui_free(void* ptr);
void _simgui_init_pool(_simgui_pool_t* pool, int num);
void _simgui_discard_pool(_simgui_pool_t* pool);
int _simgui_pool_alloc_index(_simgui_pool_t* pool);
void _simgui_pool_free_index(_simgui_pool_t* pool, int slot_index);
uint _simgui_slot_init(_simgui_pool_t* pool, _simgui_slot_t* slot, int slot_index);
int _simgui_slot_index(uint id);
void _simgui_init_item_pool(_simgui_pool_t* pool, int pool_size,
        void** items_ptr, size_t item_size_bytes);
void _simgui_discard_item_pool(_simgui_pool_t* pool, void** items_ptr);
void _simgui_setup_image_pool(int pool_size);
void _simgui_discard_image_pool();
simgui_image_t _simgui_make_image_handle(uint id);
_simgui_image_t* _simgui_image_at(uint id);
_simgui_image_t* _simgui_lookup_image(uint id);
simgui_image_t _simgui_alloc_image();
_simgui_resource_state _simgui_init_image(_simgui_image_t* img, const(simgui_image_desc_t)* desc);
void _simgui_deinit_image(_simgui_image_t* img);
void _simgui_destroy_image(simgui_image_t img_id);
void _simgui_destroy_all_images();
simgui_image_desc_t _simgui_image_desc_defaults(const(simgui_image_desc_t)* desc);
bool _simgui_is_osx();
simgui_desc_t _simgui_desc_defaults(const(simgui_desc_t)* desc);
void simgui_setup(const(simgui_desc_t)* desc);
void simgui_shutdown();
simgui_image_t simgui_make_image(const(simgui_image_desc_t)* desc);
void simgui_destroy_image(simgui_image_t img_id);
simgui_image_desc_t simgui_query_image_desc(simgui_image_t img_id);
void* simgui_imtextureid(simgui_image_t img);
simgui_image_t simgui_image_from_imtextureid(void* imtextureid);
void simgui_new_frame(const(simgui_frame_desc_t)* desc);
const(_simgui_image_t)* _simgui_bind_image_sampler(sg.Bindings* bindings, ImTextureID tex_id);
ImDrawList* _simgui_imdrawlist_at(ImDrawData* draw_data, int cl_index);
void simgui_render();
void simgui_add_focus_event(bool focus);
void simgui_add_mouse_pos_event(float x, float y);
void simgui_add_touch_pos_event(float x, float y);
void simgui_add_mouse_button_event(int mouse_button, bool down);
void simgui_add_touch_button_event(int mouse_button, bool down);
void simgui_add_mouse_wheel_event(float wheel_x, float wheel_y);
void simgui_add_key_event(int function(int) map_keycode, int keycode, bool down);
void simgui_add_input_character(uint c);
void simgui_add_input_characters_utf8(const(char)* c);
bool _simgui_is_ctrl(uint modifiers);
ImGuiKey _simgui_map_keycode(sapp.Keycode key);
void _simgui_add_sapp_key_event(ImGuiIO* io, sapp.Keycode sapp_key, bool down);
void _simgui_add_imgui_key_event(ImGuiIO* io, ImGuiKey imgui_key, bool down);
void _simgui_update_modifiers(ImGuiIO* io, uint mods);
ImGuiKey _simgui_copypaste_modifier();
int simgui_map_keycode(sapp.Keycode keycode);
bool simgui_handle_event(const(sapp.Event)* ev);

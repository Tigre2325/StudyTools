-- Xournal Default Palette
local black      = 0x000000
local green      = 0x008000
local lightBlue  = 0x00c0ff
local lightGreen = 0x00ff00
local blue       = 0x3333cc
local gray       = 0x808080
local red        = 0xff0000
local magenta    = 0xff00ff
local orange     = 0xff8000
local yellow     = 0xffff00
local white      = 0xffffff


-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  -- app.registerUi({["menu"] = "NAME", ["callback"] = "run", ["accelerator"] = "<Alt>F1"});
  app.registerUi({["menu"] = "Default - Black pen", ["callback"] = "default"});
  app.registerUi({["menu"] = "Exercise - Blue pen", ["callback"] = "exercise"});
  app.registerUi({["menu"] = "Important - Red pen", ["callback"] = "important"});
  app.registerUi({["menu"] = "Correction - Green pen", ["callback"] = "correction"});
  app.registerUi({["menu"] = "Cancel - Orange thick pen", ["callback"] = "cancel"});
  app.registerUi({["menu"] = "Note to self - Light blue pen", ["callback"] = "notToSelf"});
  app.registerUi({["menu"] = "Box answer - Magenta rectangle highlighter", ["callback"] = "boxAnswer"});
end

-- Functions
function resetDrawingTools()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled "] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled "] = false})
  app.uiAction({["action"] = "ACTION_RULER", ["enabled "] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_COORDINATE_SYSTEM", ["enabled "] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_SPLINE", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_SHAPE_RECOGNIZER", ["enabled"] = false})
end


function defaultPen(color)
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
  app.uiAction({["action"] = "ACTION_TOOL_PEN_SIZE_FINE"})
  app.uiAction({["action"] = "ACTION_TOOL_PEN_FILL", ["enabled"] = false})
  app.changeToolColor({["color"] = color, ["tool"] = "PEN"})
  resetDrawingTools()
end


function default()
  defaultPen(black)
end

function exercise()
  defaultPen(blue)
end

function important()
  defaultPen(red)
end

function correction()
  defaultPen(green)
end

function boxAnswer()
  app.uiAction({["action"] = "ACTION_TOOL_HIGHLIGHTER"})
  app.uiAction({["action"] = "ACTION_TOOL_HIGHLIGHTER_SIZE_FINE"})
  app.uiAction({["action"] = "ACTION_TOOL_HIGHLIGHTER_FILL", ["enabled"] = false})
  app.changeToolColor({["color"] = magenta, ["tool"] = "HIGHLIGHTER"})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT"})
end

function cancel()
  defaultPen(orange)
  app.uiAction({["action"] = "ACTION_TOOL_PEN_SIZE_THICK"})
end

function notToSelf()
  defaultPen(lightBlue)
end
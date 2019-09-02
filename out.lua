-- Generated by Haxe 4.0.0-rc.3+e3df7a448
local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local Array = _hx_e()
local Main = _hx_e()
local Script = _hx_e()
local Math = _hx_e()
local String = _hx_e()
local Std = _hx_e()
__haxe_Log = _hx_e()
__lua_Boot = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw
local _hx_pcall_default = {};
local _hx_pcall_break = {};

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self, 0);
end
Array.prototype = _hx_a();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local ret = _g;
  local _g3 = 0;
  while (_g3 < a.length) do 
    local i1 = a[_g3];
    _g3 = _g3 + 1;
    ret:push(i1);
  end;
  do return ret end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _gthis = self;
  local cur_length = 0;
  local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end});
  while (i:hasNext()) do 
    local i1 = i:next();
    _G.table.insert(tbl, Std.string(i1));
  end;
  do return _G.table.concat(tbl, sep) end
end
Array.prototype.pop = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[self.length - 1];
  self[self.length - 1] = nil;
  self.length = self.length - 1;
  do return ret end
end
Array.prototype.push = function(self,x) 
  self[self.length] = x;
  do return self.length end
end
Array.prototype.reverse = function(self) 
  local tmp;
  local i = 0;
  while (i < Std.int(self.length / 2)) do 
    tmp = self[i];
    self[i] = self[(self.length - i) - 1];
    self[(self.length - i) - 1] = tmp;
    i = i + 1;
  end;
end
Array.prototype.shift = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[0];
  if (self.length == 1) then 
    self[0] = nil;
  else
    if (self.length > 1) then 
      self[0] = self[1];
      _G.table.remove(self, 1);
    end;
  end;
  local tmp = self;
  tmp.length = tmp.length - 1;
  do return ret end
end
Array.prototype.slice = function(self,pos,_end) 
  if ((_end == nil) or (_end > self.length)) then 
    _end = self.length;
  else
    if (_end < 0) then 
      _end = _G.math.fmod((self.length - (_G.math.fmod(-_end, self.length))), self.length);
    end;
  end;
  if (pos < 0) then 
    pos = _G.math.fmod((self.length - (_G.math.fmod(-pos, self.length))), self.length);
  end;
  if ((pos > _end) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  end;
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
  end;
  do return ret end
end
Array.prototype.sort = function(self,f) 
  local i = 0;
  local l = self.length;
  while (i < l) do 
    local swap = false;
    local j = 0;
    local max = (l - i) - 1;
    while (j < max) do 
      if (f(self[j], self[j + 1]) > 0) then 
        local tmp = self[j + 1];
        self[j + 1] = self[j];
        self[j] = tmp;
        swap = true;
      end;
      j = j + 1;
    end;
    if (not swap) then 
      break;
    end;
    i = i + 1;
  end;
end
Array.prototype.splice = function(self,pos,len) 
  if ((len < 0) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  else
    if (pos < 0) then 
      pos = self.length - (_G.math.fmod(-pos, self.length));
    end;
  end;
  len = Math.min(len, self.length - pos);
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = pos + len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
    self[i] = self[i + len];
  end;
  local _g2 = pos + len;
  local _g3 = self.length;
  while (_g2 < _g3) do 
    _g2 = _g2 + 1;
    local i1 = _g2 - 1;
    self[i1] = self[i1 + len];
  end;
  local tmp = self;
  tmp.length = tmp.length - len;
  do return ret end
end
Array.prototype.toString = function(self) 
  local tbl = ({});
  _G.table.insert(tbl, "[");
  _G.table.insert(tbl, self:join(","));
  _G.table.insert(tbl, "]");
  do return _G.table.concat(tbl, "") end
end
Array.prototype.unshift = function(self,x) 
  local len = self.length;
  local _g = 0;
  local _g1 = len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    self[len - i] = self[(len - i) - 1];
  end;
  self[0] = x;
end
Array.prototype.insert = function(self,pos,x) 
  if (pos > self.length) then 
    pos = self.length;
  end;
  if (pos < 0) then 
    pos = self.length + pos;
    if (pos < 0) then 
      pos = 0;
    end;
  end;
  local cur_len = self.length;
  while (cur_len > pos) do 
    self[cur_len] = self[cur_len - 1];
    cur_len = cur_len - 1;
  end;
  self[pos] = x;
end
Array.prototype.remove = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (self[i] == x) then 
      local _g2 = i;
      local _g11 = self.length - 1;
      while (_g2 < _g11) do 
        _g2 = _g2 + 1;
        local j = _g2 - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.indexOf = function(self,x,fromIndex) 
  local _end = self.length;
  if (fromIndex == nil) then 
    fromIndex = 0;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        fromIndex = 0;
      end;
    end;
  end;
  local _g = fromIndex;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (x == self[i]) then 
      do return i end;
    end;
  end;
  do return -1 end
end
Array.prototype.lastIndexOf = function(self,x,fromIndex) 
  if ((fromIndex == nil) or (fromIndex >= self.length)) then 
    fromIndex = self.length - 1;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        do return -1 end;
      end;
    end;
  end;
  local i = fromIndex;
  while (i >= 0) do 
    if (self[i] == x) then 
      do return i end;
    else
      i = i - 1;
    end;
  end;
  do return -1 end
end
Array.prototype.copy = function(self) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    if (f(i)) then 
      _g:push(i);
    end;
  end;
  do return _g end
end
Array.prototype.iterator = function(self) 
  local _gthis = self;
  local cur_length = 0;
  do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end}) end
end
Array.prototype.resize = function(self,len) 
  if (self.length < len) then 
    self.length = len;
  else
    if (self.length > len) then 
      local _g = len;
      local _g1 = self.length;
      while (_g < _g1) do 
        _g = _g + 1;
        local i = _g - 1;
        self[i] = nil;
      end;
      self.length = len;
    end;
  end;
end

Main.new = {}
Main.main = function() 
  Script.new();
end

Script.new = function() 
  local self = _hx_new(Script.prototype)
  Script.super(self)
  return self
end
Script.super = function(self) 
  self.fuel = 0;
  self.mined = false;
  self.mine = true;
  self.y = 0;
  self.detail = nil;
  self.printer = nil;
  self.driver = "";
  self:print("shadow craft\n");
  self:setup();
  self:task();
end
Script.prototype = _hx_a();
Script.prototype.setup = function(self) 
  local type = "";
  local side = "left";
  if (peripheral.isPresent(side)) then 
    type = peripheral.getType(side);
    __haxe_Log.trace(Std.string("type ") .. Std.string(type), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=56,className="Script",methodName="setup"}));
    local type1 = type;
    if (type1) == "drive" then 
      self.driver = side;
    elseif (type1) == "modem" then 
      __haxe_Log.trace("network open", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=66,className="Script",methodName="setup"}));
      rednet.open(side);
    elseif (type1) == "monitor" then 
      self.monitor = peripheral.wrap(side);
    elseif (type1) == "printer" then 
      self.printer = peripheral.wrap(side); end;
  end;
  local side1 = "right";
  if (peripheral.isPresent(side1)) then 
    type = peripheral.getType(side1);
    __haxe_Log.trace(Std.string("type ") .. Std.string(type), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=56,className="Script",methodName="setup"}));
    local type2 = type;
    if (type2) == "drive" then 
      self.driver = side1;
    elseif (type2) == "modem" then 
      __haxe_Log.trace("network open", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=66,className="Script",methodName="setup"}));
      rednet.open(side1);
    elseif (type2) == "monitor" then 
      self.monitor = peripheral.wrap(side1);
    elseif (type2) == "printer" then 
      self.printer = peripheral.wrap(side1); end;
  end;
  local side2 = "top";
  if (peripheral.isPresent(side2)) then 
    type = peripheral.getType(side2);
    __haxe_Log.trace(Std.string("type ") .. Std.string(type), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=56,className="Script",methodName="setup"}));
    local type3 = type;
    if (type3) == "drive" then 
      self.driver = side2;
    elseif (type3) == "modem" then 
      __haxe_Log.trace("network open", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=66,className="Script",methodName="setup"}));
      rednet.open(side2);
    elseif (type3) == "monitor" then 
      self.monitor = peripheral.wrap(side2);
    elseif (type3) == "printer" then 
      self.printer = peripheral.wrap(side2); end;
  end;
  local side3 = "bottom";
  if (peripheral.isPresent(side3)) then 
    type = peripheral.getType(side3);
    __haxe_Log.trace(Std.string("type ") .. Std.string(type), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=56,className="Script",methodName="setup"}));
    local type4 = type;
    if (type4) == "drive" then 
      self.driver = side3;
    elseif (type4) == "modem" then 
      __haxe_Log.trace("network open", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=66,className="Script",methodName="setup"}));
      rednet.open(side3);
    elseif (type4) == "monitor" then 
      self.monitor = peripheral.wrap(side3);
    elseif (type4) == "printer" then 
      self.printer = peripheral.wrap(side3); end;
  end;
end
Script.prototype.forwardCheck = function(self) 
  self:print("check forward");
  if (turtle.forward()) then 
    turtle.back();
    do return true end;
  end;
  self:print(Std.string("rotate ") .. Std.string(0));
  turtle.turnLeft();
  if (turtle.forward()) then 
    turtle.back();
    do return true end;
  end;
  self:print(Std.string("rotate ") .. Std.string(1));
  turtle.turnLeft();
  if (turtle.forward()) then 
    turtle.back();
    do return true end;
  end;
  self:print(Std.string("rotate ") .. Std.string(2));
  turtle.turnLeft();
  self:print("forward check failed");
  do return false end
end
Script.prototype.task = function(self) 
  local _g = self:input();
  if (_g == nil) then 
    self:print("task not found\n");
  else
    local _g1 = _g;
    if (_g1) == "axe" then 
      if (not self:forwardCheck()) then 
        do return end;
      end;
      while (true) do 
        self.detail = _G.select(2, turtle.inspect());
        local _this = self.detail.name;
        local startIndex = #"minecraft:";
        local endIndex = #self.detail.name;
        if (endIndex == nil) then 
          endIndex = #_this;
        end;
        if (endIndex < 0) then 
          endIndex = 0;
        end;
        if (startIndex < 0) then 
          startIndex = 0;
        end;
        if ((function() 
          local _hx_1
          if (endIndex < startIndex) then 
          _hx_1 = _G.string.sub(_this, endIndex + 1, startIndex); else 
          _hx_1 = _G.string.sub(_this, startIndex + 1, endIndex); end
          return _hx_1
        end )() == "log") then 
          self:axe();
        else
          self:sleep(1);
        end;
      end;
    elseif (_g1) == "burn" then 
      fs.copy("shadowcraft.lua", "disk/startup.lua");
    elseif (_g1) == "eject" then 
      self:eject();
    elseif (_g1) == "exit" then 
      self:exit();
    elseif (_g1) == "forward" then 
      self:forwardCheck();
    elseif (_g1) == "inspect" then 
      self.detail = _G.select(2, turtle.inspect());
      __haxe_Log.trace(Std.string("name ") .. Std.string(self.detail.name), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Main.hx",lineNumber=96,className="Script",methodName="task"}));
    elseif (_g1) == "td" then 
      self.fuel = turtle.getFuelLevel();
      self.mine = true;
      self:print("Ctrl+T = End Task, y cord:");
      local response = Std.parseInt(self:input());
      if (response == nil) then 
        self:print("Invalid y pos");
        do return end;
      end;
      self.y = response;
      if (not self:forwardCheck()) then 
        self:print("failed forward check");
      end;
      self:diamonds();
    elseif (_g1) == "update" then 
      os.reboot();else
    self:print("task not found\n"); end;
  end;
  self:task();
  _G.sleep(2);
end
Script.prototype.axe = function(self) 
  turtle.dig();
  turtle.forward();
  self.mined = true;
  while (self.mined) do 
    self:up();
  end;
  while (self.y > 0) do 
    if (not turtle.down()) then 
      self:print("can't go back down");
    end;
  end;
  turtle.back();
end
Script.prototype.diamonds = function(self) 
  local update = true;
  if (self.y > 0) then 
    local diff = 0;
    while (update) do 
      diff = self.y - 12;
      if (diff ~= 0) then 
        if (diff > 0) then 
          self:down();
        else
          self:up();
        end;
        self:print(Std.string(Std.string(Std.string("y ") .. Std.string(self.y)) .. Std.string(" dif ")) .. Std.string(diff));
      else
        update = false;
      end;
    end;
  end;
  update = true;
  while ((self.fuel > 10) and update) do 
    turtle.digUp();
    turtle.digDown();
    update = turtle.dig();
    self:print(Std.string(Std.string(Std.string("dig: ") .. Std.string(Std.string(update))) .. Std.string(" f: ")) .. Std.string(self.fuel));
    if (not turtle.forward()) then 
      update = false;
    end;
  end;
  self:print("finish");
end
Script.prototype.up = function(self) 
  if (self.mine) then 
    self.mined = turtle.digUp();
  end;
  if (turtle.up()) then 
    self.fuel = self.fuel - 1;
    local tmp = self;
    tmp.y = tmp.y + 1;
    do return true end;
  end;
  do return false end
end
Script.prototype.down = function(self) 
  if (self.mine) then 
    self.mined = turtle.digDown();
  end;
  if (turtle.down()) then 
    self.fuel = self.fuel - 1;
    local tmp = self;
    tmp.y = tmp.y + -1;
    do return true end;
  end;
  do return false end
end
Script.prototype.exit = function(self) 
  _G.os.exit(0);
end
Script.prototype.sleep = function(self,seconds) 
  _G.sleep(seconds);
end
Script.prototype.eject = function(self) 
  disk.eject(self.driver);
end
Script.prototype.input = function(self) 
  _G.io.flush();
  local read = _G.io.read();
  if (read ~= nil) then 
    read = _G.string.lower(read);
  end;
  do return read end
end
Script.prototype.print = function(self,value) 
  _G.io.write(Std.string(Std.string(Std.string(value)) .. Std.string("\n")));
  _G.io.flush();
end

Math.new = {}
Math.isNaN = function(f) 
  do return f ~= f end;
end
Math.isFinite = function(f) 
  if (f > -_G.math.huge) then 
    do return f < _G.math.huge end;
  else
    do return false end;
  end;
end
Math.min = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.min(a, b) end;
  end;
end

String.new = function(string) 
  local self = _hx_new(String.prototype)
  String.super(self,string)
  self = string
  return self
end
String.super = function(self,string) 
end
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((_G.type(o) == "string") and ((String.prototype[field] ~= nil) or (field == "length"))) then 
      _hx_1 = true; elseif (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        if (_G.type(String.__oldindex) == "function") then 
          do return String.__oldindex(s, k) end;
        else
          if (_G.type(String.__oldindex) == "table") then 
            do return String.__oldindex[k] end;
          end;
        end;
        do return nil end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_a();
String.prototype.toUpperCase = function(self) 
  do return _G.string.upper(self) end
end
String.prototype.toLowerCase = function(self) 
  do return _G.string.lower(self) end
end
String.prototype.indexOf = function(self,str,startIndex) 
  if (startIndex == nil) then 
    startIndex = 1;
  else
    startIndex = startIndex + 1;
  end;
  local r = _G.string.find(self, str, startIndex, true);
  if ((r ~= nil) and (r > 0)) then 
    do return r - 1 end;
  else
    do return -1 end;
  end;
end
String.prototype.lastIndexOf = function(self,str,startIndex) 
  local i = 0;
  local ret = -1;
  if (startIndex == nil) then 
    startIndex = #self;
  end;
  while (true) do 
    local startIndex1 = ret + 1;
    if (startIndex1 == nil) then 
      startIndex1 = 1;
    else
      startIndex1 = startIndex1 + 1;
    end;
    local r = _G.string.find(self, str, startIndex1, true);
    local p = (function() 
      local _hx_1
      if ((r ~= nil) and (r > 0)) then 
      _hx_1 = r - 1; else 
      _hx_1 = -1; end
      return _hx_1
    end )();
    if ((p == -1) or (p > startIndex)) then 
      break;
    end;
    ret = p;
  end;
  do return ret end
end
String.prototype.split = function(self,delimiter) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  local delim_offset = (function() 
    local _hx_1
    if (#delimiter > 0) then 
    _hx_1 = #delimiter; else 
    _hx_1 = 1; end
    return _hx_1
  end )();
  while (idx ~= nil) do 
    local newidx = 0;
    if (#delimiter > 0) then 
      newidx = _G.string.find(self, delimiter, idx, true);
    else
      if (idx >= #self) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      local match = _G.string.sub(self, idx, newidx - 1);
      ret:push(match);
      idx = newidx + #delimiter;
    else
      ret:push(_G.string.sub(self, idx, #self));
      idx = nil;
    end;
  end;
  do return ret end
end
String.prototype.toString = function(self) 
  do return self end
end
String.prototype.substring = function(self,startIndex,endIndex) 
  if (endIndex == nil) then 
    endIndex = #self;
  end;
  if (endIndex < 0) then 
    endIndex = 0;
  end;
  if (startIndex < 0) then 
    startIndex = 0;
  end;
  if (endIndex < startIndex) then 
    do return _G.string.sub(self, endIndex + 1, startIndex) end;
  else
    do return _G.string.sub(self, startIndex + 1, endIndex) end;
  end;
end
String.prototype.charAt = function(self,index) 
  do return _G.string.sub(self, index + 1, index + 1) end
end
String.prototype.charCodeAt = function(self,index) 
  do return _G.string.byte(self, index + 1) end
end
String.prototype.substr = function(self,pos,len) 
  if ((len == nil) or (len > (pos + #self))) then 
    len = #self;
  else
    if (len < 0) then 
      len = #self + len;
    end;
  end;
  if (pos < 0) then 
    pos = #self + pos;
  end;
  if (pos < 0) then 
    pos = 0;
  end;
  do return _G.string.sub(self, pos + 1, pos + len) end
end

Std.new = {}
Std.string = function(s) 
  do return __lua_Boot.__string_rec(s) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end
Std.parseInt = function(x) 
  if (x == nil) then 
    do return nil end;
  end;
  local hexMatch = _G.string.match(x, "^ *[%-+]*0[xX][%da-fA-F]*");
  if (hexMatch ~= nil) then 
    local pos = 2;
    local len = nil;
    if ((len == nil) or (len > (pos + #hexMatch))) then 
      len = #hexMatch;
    else
      if (len < 0) then 
        len = #hexMatch + len;
      end;
    end;
    if (pos < 0) then 
      pos = #hexMatch + pos;
    end;
    if (pos < 0) then 
      pos = 0;
    end;
    do return _G.tonumber(_G.string.sub(hexMatch, pos + 1, pos + len), 16) end;
  else
    local intMatch = _G.string.match(x, "^ *[%-+]?%d*");
    if (intMatch ~= nil) then 
      do return _G.tonumber(intMatch) end;
    else
      do return nil end;
    end;
  end;
end

__haxe_Log.new = {}
__haxe_Log.formatOutput = function(v,infos) 
  local str = Std.string(v);
  if (infos == nil) then 
    do return str end;
  end;
  local pstr = Std.string(Std.string(infos.fileName) .. Std.string(":")) .. Std.string(infos.lineNumber);
  if (infos.customParams ~= nil) then 
    local _g = 0;
    local _g1 = infos.customParams;
    while (_g < _g1.length) do 
      local v1 = _g1[_g];
      _g = _g + 1;
      str = Std.string(str) .. Std.string((Std.string(", ") .. Std.string(Std.string(v1))));
    end;
  end;
  do return Std.string(Std.string(pstr) .. Std.string(": ")) .. Std.string(str) end;
end
__haxe_Log.trace = function(v,infos) 
  local str = __haxe_Log.formatOutput(v, infos);
  _hx_print(str);
end

__lua_Boot.new = {}
__lua_Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
__lua_Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(Std.string(o[0])) .. Std.string("(");
    s = Std.string(s) .. Std.string("\t");
    local _g = 2;
    local _g1 = o.length;
    while (_g < _g1) do 
      _g = _g + 1;
      local i = _g - 1;
      if (i ~= 2) then 
        str = Std.string(str) .. Std.string((Std.string(",") .. Std.string(__lua_Boot.__string_rec(o[i], s))));
      else
        str = Std.string(str) .. Std.string(__lua_Boot.__string_rec(o[i], s));
      end;
    end;
    do return Std.string(str) .. Std.string(")") end;
  end;
end
__lua_Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = __lua_Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
__lua_Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  if (#s >= 5) then 
    do return "<...>" end;
  end;
  local _g = type(o);
  if (_g) == "boolean" then 
    do return tostring(o) end;
  elseif (_g) == "function" then 
    do return "<function>" end;
  elseif (_g) == "nil" then 
    do return "null" end;
  elseif (_g) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o == 0) then 
          do return "0" end;
        else
          if (o ~= o) then 
            do return "NaN" end;
          else
            do return tostring(o) end;
          end;
        end;
      end;
    end;
  elseif (_g) == "string" then 
    do return o end;
  elseif (_g) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return __lua_Boot.printEnum(o, s) end;
    else
      if ((_hx_wrap_if_string_field(o,'toString') ~= nil) and not __lua_Boot.isArray(o)) then 
        do return _hx_wrap_if_string_field(o,'toString')(o) end;
      else
        if (__lua_Boot.isArray(o)) then 
          local o2 = o;
          if (#s > 5) then 
            do return "[...]" end;
          else
            local _g1 = _hx_tab_array({}, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g1:push(__lua_Boot.__string_rec(i, Std.string(s) .. Std.string(1)));
            end;
            do return Std.string(Std.string("[") .. Std.string(_g1:join(","))) .. Std.string("]") end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return Std.string(Std.string("{") .. Std.string(__lua_Boot.printClassRec(o, "", Std.string(s) .. Std.string("\t")))) .. Std.string("}") end;
          else
            local fields = __lua_Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer, "{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer, ", ");
              end;
              _G.table.insert(buffer, Std.string(Std.string(Std.string("") .. Std.string(Std.string(f1))) .. Std.string(" : ")) .. Std.string(__lua_Boot.__string_rec(o[f1], Std.string(s) .. Std.string("\t"))));
            end;
            _G.table.insert(buffer, " }");
            do return _G.table.concat(buffer, "") end;
          end;
        end;
      end;
    end;
  elseif (_g) == "thread" then 
    do return "<thread>" end;
  elseif (_g) == "userdata" then 
    local mt = _G.getmetatable(o);
    if ((mt ~= nil) and (mt.__tostring ~= nil)) then 
      do return _G.tostring(o) end;
    else
      do return "<userdata>" end;
    end;else
  _G.error("Unknown Lua type",0); end;
end
__lua_Boot.fieldIterator = function(o) 
  if (_G.type(o) ~= "table") then 
    do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
      do return nil end;
    end,hasNext=function(self) 
      do return false end;
    end}) end;
  end;
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (__lua_Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1, val);
    end;
    do return val end;
  end;
  local cur_val = next_valid(tbl, cur(tbl, nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local ret = cur_val;
    cur_val = next_valid(tbl, cur(tbl, cur_val));
    do return ret end;
  end,hasNext=function(self) 
    do return cur_val ~= nil end;
  end}) end;
end
_hx_bit_clamp = function(v)
  if v <= 2147483647 and v >= -2147483648 then
    if v > 0 then return _G.math.floor(v)
    else return _G.math.ceil(v)
    end
  end
  if v > 2251798999999999 then v = v*2 end;
  if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
  return _hx_bit.band(v, 2147483647 ) - math.abs(_hx_bit.band(v, 2147483648))
end

-- require this for lua 5.1
pcall(require, 'bit')
if bit then
  _hx_bit = bit
else
  local _hx_bit_raw = _G.require('bit32')
  _hx_bit = setmetatable({}, { __index = _hx_bit_raw });
  -- lua 5.2 weirdness
  _hx_bit.bnot = function(...) return _hx_bit_clamp(_hx_bit_raw.bnot(...)) end;
  _hx_bit.bxor = function(...) return _hx_bit_clamp(_hx_bit_raw.bxor(...)) end;
end

_hx_array_mt.__index = Array.prototype

local _hx_static_init = function()
  __lua_Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
  
end

_hx_print = print or (function() end)

_hx_wrap_if_string_field = function(o, fld)
  if _G.type(o) == 'string' then
    if fld == 'length' then
      return _G.string.len(o)
    else
      return String.prototype[fld]
    end
  else
    return o[fld]
  end
end

_hx_static_init();
Main.main()

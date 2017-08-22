#z::Pause  ;stop the ahk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#o::  ;open class learning
Run, C:\01 大一
Sleep 1000
IfWinNotExist, ahk_exe PotPlayerMini64.exe
	Run, PotPlayerMini64.exe
Sleep 5000
WinActivate, ahk_exe PotPlayerMini64.exe
Send {Space}
Sleep 1000
IfWinNotExist, ahk_exe onenote.exe
	Run, onenote.exe
Sleep 5000
WinActivate, ahk_exe onenote.exe
Sleep 1000
Run,  C:\Datebase\Nutstore\Onenote\04 公开课程\99 其它\fsociety.one
Sleep 1000
send ^n
Sleep 500
Send !+d{Space}!+t
Sleep 500
send {enter}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^#o:: ;stop open class learning
IfWinExist, ahk_exe PotPlayerMini64.exe
{
	WinActivate, ahk_exe PotPlayerMini64.exe
	Sleep 500
	send !{F4}
}
Sleep 500
Run, C:\01 大一
Sleep 500
send !{F4}
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#b::  ;books learning
Run, C:\Datebase\Nutstore\Kindle\Kindle\03  Major\01 Computer Science 
Sleep 1000
Run, C:\Users\S\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\开机启动backup\run\Drawboard PDF for Surface
Sleep 1000
IfWinNotExist, ahk_exe onenote.exe
	Run, onenote.exe
Sleep 5000
WinActivate, ahk_exe onenote.exe
Sleep 1000
Run,  C:\Datebase\Nutstore\Onenote\04 公开课程\99 其它\fsociety.one
Sleep 1000
send ^n
Sleep 500
Send !+d{Space}!+t
Sleep 500
send {enter}
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#c::  ;paste start
#SingleInstance,Force
#NoEnv
Loop
{
	ClipSaved := ClipboardAll
	if(ClipSaved != "")
	{
		IfWinNotExist, ahk_exe onenote.exe
			Run, onenote.exe
		WinActivate , ahk_exe onenote.exe
		sleep, 300
		send, ^v`n
		sleep, 200
		Send {alt down}
		Send {tab down}
		Send {tab up}
		Send {alt up}
		
	}
	Clipboard :=""
	Sleep 1000
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;如果vim运行了，一旦窗口处于激活状态，窗口正常，非激活状态，顶置+半透明
#v::
#SingleInstance, Force
#NoEnv
IfWinExist, ahk_exe gvim.exe
	Loop
	{
	winset AlwaysOnTop, ON, ahk_exe gvim.exe
	IfWinNotActive, ahk_exe gvim.exe
		Winset Transparent, 150, ahk_exe gvim.exe
	IfWinActive, ahk_exe gvim.exe
		Winset Transparent, 255, ahk_exe gvim.exe
	}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;关闭该效果
#g::
IfWinExist, ahk_exe gvim.exe
	winset AlwaysOnTop, Off, ahk_exe gvim.exe
	WinSet Transparent, 255, ahk_exe gvim.exe
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#t::  ;补全括号
:*:(::(){left}
:*:[::[]{left}
:*:"::""{left}
:*:'::''{left}
:*:<::<>{left}
:*:《::《》{left}
:*:{::{{}{}}{left}
:*b0:``::{``}{left}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CREATER: Mzp_Drkp2017  
;  
;左侧shift+鼠标滚轮调整窗口透明度（设置30-255的透明度，低于30基本上就看不见了，如需要可自行修改）2016.09.20.by M.（2017.01.11__1635 edit again.M）  
;  
;使用说明：  
;   ◆左侧shift+滚轮下滑：减少透明度，一次10  
;   ◆左侧shift+滚轮上滑：增加透明度，一次20  
;   ◆左侧shift+中键按下：恢复透明度至255(完全不透明).  
;
~LShift & Up::  
; 透明度调整，增加。  
WinGet, Transparent, Transparent,A  
If (Transparent="")  
    Transparent=255  
    ;Transparent_New:=Transparent+10  
    Transparent_New:=Transparent+20    ;◆透明度增加速度。  
    If (Transparent_New > 254)  
                    Transparent_New =255  
    WinSet,Transparent,%Transparent_New%,A  
return  
   
~LShift & Down::  
;透明度调整，减少。  
WinGet, Transparent, Transparent,A  
If (Transparent="")  
    Transparent=255  
    Transparent_New:=Transparent-10  ;◆透明度减少速度。  
    ;msgbox,Transparent_New=%Transparent_New%  
            If (Transparent_New < 30)    ;◆最小透明度限制。  
                    Transparent_New = 30  
    WinSet,Transparent,%Transparent_New%,A  
return  
   
;设置Lwin &Mbutton直接恢复透明度到255。  
~Lshift & Space::   
WinGet, Transparent, Transparent,A  
WinSet,Transparent,255,A   
return  

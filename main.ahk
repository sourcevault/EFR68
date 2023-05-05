SendLevel 3
#InputLevel 3

#NoEnv
#SingleInstance force

SendMode Input

#Include <dual/dual>

dual := new Dual({delay: 70, timeout: 300, doublePress: 200, specificDelays: false})

#Include loc.ahk

#Include <dual/defaults>

#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.

*F12::dual.reset()

;;------------------French 2 ---------------

; ------------------French -----------------

*F1::
  dual.combo("")
  SendInput {Ctrl DOWN}
  SendInput {U+00E9}{Ctrl UP}
  return

#if (Toggle=0) ; French Version 4
{

  *=::switch_language_main()

  *1::fn_row("{F1}",1)

  *2::fn_row("{F2}",2)

  *3::fn_row("{F3}",3)

  *4::fn_row("{F4}",4)

  *5::fn_row("{F5}",5)

  *6::fn_row("{F6}",6)

  *7::fn_row("{F7}",7)

  *8::fn_row("{F8}",8)

  *9::fn_row("{F9}",9)

  *0::fn_row("{F10}",0)

  *-::dual.comboKey("CapsLock")

  ; ; -----------------------

  *Tab::
  *Tab UP::single_quote_accent("<")

  *q::dual.comboKey("g",{RShift:">"})

  *w::dual.comboKey(".",{RShift:"{"})

  *e::dual.comboKey("l",{RShift:"}"})

  *r::dual.comboKey("m",{RShift:"#"})

  *t::dual.comboKey("k",{RShift:"%"})

  ; ;-------------------------

  *CapsLock::dual.comboKey("b",{RShift:["{RShift UP}","[","{RShift DOWN}"]})

  *a::dual.comboKey("s",{RShift:["{RShift UP}","]","{RShift DOWN}"]})

  *s::dual.comboKey("t",{RShift:"("})

  *d::
  *d UP::dual.combine("LCtrl","",{doublePress:70},{custom:Func("fr_I")})

  *f::
  *f UP::dual.combine("RShift","",{doublePress:30},{custom:Func("fr_C")})

  *g::
  *g UP::dual.combine("RAlt","d",false,{RShift:["{RShift UP}","-","{RShift DOWN}"]})

  ; ; -------------------------

  *LShift::
  *LShift UP::double_quote_accent("@")

  *z::dual.comboKey("z",{RShift:"!"})

  *x::dual.comboKey("up")

  *c::dual.comboKey("down")

  *v::dual.comboKey("v",{RShift:"$"})

  *b::dual.comboKey("x",{RShift:"+"})

  ; ;-------------------------

  *`::
  *` UP::grave_accent()

  *F8::dual.comboKey("PgUp")

  *left::dual.comboKey("PgDn")

  *right::dual.comboKey("q",{RShift:["{RShift UP}",";","{RShift DOWN}"]})

  ; ;-------------------------

  *y::dual.comboKey("_",{RShift:"*"})

  *u::fr_remap2("f",6)

  *i::fr_U()

  *o::fr_remap2("y",8)

  *p::fr_remap2("w",9)

  *\::dual.comboKey("j",{RShift:"?"})

  ; ;-------------------------

  *h::
  *h UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("fr_H")})

  *j::
  *j UP::dual.combine("Ctrl","",{doublePress:30},{custom:Func("fr_N")})

  *k::
  *k UP::dual.combine("RShift","",{doublePress:30},{custom:Func("fr_A")})

  *l::fr_O()

  *;::fr_remap2("r",4)

  *'::fr_remap2("p",5)

   ; ; -------------------------

  *n::dual.comboKey("\",{RShift:"|"})
  *m::dual.comboKey("home")
  *,::dual.comboKey("left")
  *.::dual.comboKey("right")
  */::dual.comboKey("end")

  *RShift::
    dual.combo("")
    fr_EE("{/}")
    return

   ; ;------------------------

  *up::dual.comboKey("F11")

  *down::dual.comboKey("F12")

  *[::dual.comboKey("F13")

  *]::
  *] UP::hat_accent()

   ; ;-------------------------

   ; LEFT THUMB CLUSTER (COPIED)

  *Backspace::
  *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

  *Delete::
  *Delete UP::dual.combine("LShift","Tab")

  *LCtrl::dual.comboKey("Enter")

   ; ;-------------------------

  *LAlt::dual.comboKey("F14")

  *Home::
  *Home UP::

    if (JustToggled)
    {
      JustToggled := false
      SendInput {F20 up}
    }
    else
    {
      dual.combine("F20","{Esc}",{doublePress:250})
    }

    return

  *End::dual.comboKey("Delete")

   ; RIGHT THUMB CLUSTER

  *RCtrl::
  *RCtrl Up::dual.combine("Ctrl",",",{doublePress:70})

  *Enter::
  *Enter UP::dual.combine("LAlt","",{doublePress:70},{custom:Func("fr_E")})

  *PgUp::
  *PgUp UP::dual.combine("F20","F15")

  *Space::
  *Space UP::dual.combine("LShift","Space")

  ; *PgDn::
  ; *PgDn UP::dual.combine("Win","")
  ; *P::dual.comboKey("LWin")

  *PgDn::
  *PgDn UP::tilda_accent()

}


; ------------------French -------------------- 

; #if (Toggle=1) ; French Version 3
; {

;   *=::
;   *= UP::grave_accent()

;   *1::fn_row("{F1}",1)

;   *2::fn_row("{PgUp}",2)

;   *3::fn_row("{PgDn}",3)

;   *4::fn_row("{F4}",4)

;   *5::fn_row("{F5}",5)

;   *6::fn_row("{F6}",6)

;   *7::fn_row("{F7}",7)

;   *8::fn_row("{F8}",8)

;   *9::fn_row("{F9}",9)

;   *0::fn_row("{F10}",0)

;   *-::dual.comboKey("CapsLock")

;   ; ; -----------------------

;   *Tab::
;   *Tab UP::double_quote_accent("-")

;   *q::dual.comboKey("z",{RShift:"$"})

;   *w::dual.comboKey("up")

;   *e::dual.comboKey("down")

;   *r::dual.comboKey("v",{RShift:"%"})

;   *t::
;     dual.comboKey("x",{F20:"",RShift:"@"})
;     switch_language_on_F20()
;     return

;   ; ;-------------------------

;   *CapsLock::dual.comboKey("b",{RShift:["{RShift UP}","[","{RShift DOWN}"]})

;   *a::dual.comboKey("s",{RShift:["{RShift UP}","]","{RShift DOWN}"]})

;   *s::dual.comboKey("t",{RShift:"("})

;   *d::
;   *d UP::dual.combine("LCtrl","",{doublePress:30},{custom:Func("fr_I")})

;   *f::
;   *f UP::dual.combine("RShift","",{doublePress:30},{custom:Func("fr_C")})

;   *g::
;   *g UP::dual.combine("RAlt",".",false,{RShift:"!"})

;   ; ; -------------------------

;   *LShift::dual.comboKey(",",{RShift:"<"})

;   *z::dual.comboKey("g",{RShift:">"})

;   *x::dual.comboKey("m",{RShift:"{"})

;   *c::dual.comboKey("l",{RShift:"}"})

;   *v::dual.comboKey("d",{RShift:"#"})

;   *b::dual.comboKey("k",{RShift:"|"})

;   ; ;-------------------------

;   ; *`::
;   ; *` UP::single_quote_accent()

;   ; *F8::

;   *left::dual.comboKey("-")

;   *right::dual.comboKey("=")

;   ; ;-------------------------

;   *y::dual.comboKey("\")

;   *u::dual.comboKey("home")

;   *i::dual.comboKey("left")

;   *o::dual.comboKey("right")

;   *p::dual.comboKey("end")

;   *\::dual.comboKey("j",{LShift:["{LShift UP}","/","{LShift DOWN}"]})

;   ; ;-------------------------

;   *h::
;   *h UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("fr_H")})

;   *j::
;   *j UP::dual.combine("Ctrl","",{doublePress:30},{custom:Func("fr_N")})

;   *k::
;   *k UP::dual.combine("LShift","",{doublePress:30},{custom:Func("fr_A")})

;   *l::
;   *l UP::dual.combine("LAlt","",{doublePress:30},{custom:Func("fr_O")})


;   *;::fr_remap2("r",4)

;   *'::fr_remap2("p",5)

;    ; ; -------------------------

;   *n::dual.comboKey("_",{LShift:"*"})

;   *m::fr_remap2("w",6)


;   *,::fr_U()

;   *.::fr_remap2("y",8)

;   */::fr_remap2("f",9)

;   ; *RShift::fr_EE()

;    ; ;------------------------

;   *up::dual.comboKey("q",{LShift:";"})

;   *down::dual.comboKey("F12")

;   *[::dual.comboKey("F13")

;   *]::
;   *] UP::hat_accent()

;    ; ;-------------------------

;    ; LEFT THUMB CLUSTER (COPIED)

;   *Backspace::
;   *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

;   *LCtrl::
;   *LCtrl UP::

;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     else
;     {
;       dual.combine("F20","{Esc}",{doublePress:250})
;     }

;     return

;   *Delete::
;   *Delete UP::dual.combine("LShift","Enter")

;    ; ;-------------------------

;   *LAlt::dual.comboKey("F2")

;   *Home::
;   *Home UP::dual.combine("F20","Tab")

;   *End::dual.comboKey("Delete")

;    ; RIGHT THUMB CLUSTER

;   *RCtrl::
;   *RCtrl Up::dual.combine("Ctrl","",{doublePress:70},{custom:Func("switch_language_main")})

;   *Enter::
;   *Enter UP::dual.combine("LAlt","",{doublePress:70},{custom:Func("fr_E")})

;   *PgUp::
;   *PgUp UP::dual.combine("F20","F3")

;   *Space::
;   *Space UP::dual.combine("RShift","Space")


;   *PgDn::
;   *PgDn UP::tilda_accent()

;   ; ------------------------------------ 
; }
;-------------RUSSIAN----------------------

; #if (Toggle=3) ; RU
; {

;   ; RIGHT THUMB CLUSTER
;   *=::
;   *= UP::grave_accent()

;   ; Left - TOP ROW

;   *1::ru_number("{!}","1")

;   *2::ru_number("@","2")

;   *3::ru_number("#","3")

;   *4::ru_number("$","4") ; {

;   *5::ru_number("%","5") ; }

;   ; Left - NAV ROW

;   *Tab::
;   *Tab UP::double_quote_accent("-")

;   *q::ru_remap3("z","{U+0437}","{U+0417}") ; з ; З

;   *w::dual.comboKey("up")

;   *e::dual.comboKey("down")
  
;   *r::ru_remap3("v","{U+0431}","{U+0411}") ; б U+0431 ;Б U+0411

;   *t::
;   *t UP::dual.combine("Ctrl","",false,{custom:Func("ru_X")})

;   ; Left - HOME ROW

;   *CapsLock::ru_remap3("b","{U+0432}","{U+0412}") ; в ; В

;   *a::ru_remap3("s","{U+0441}","{U+0421}") ; с ; С

;   *s::ru_remap3("t","{U+0442}","{U+0422}") ;т  ;Т

;   ; *s::
;   ; *s UP::dual.combine("Ctrl","",false,{custom:Func("ru_T")})

;   *d::
;   *d UP::dual.combine("Ctrl","",false,{custom:Func("ru_I")})

;   *f::
;   *f UP::dual.combine("RShift","",false,{custom:Func("ru_C")})
  
;   *g::
;   *g UP::dual.combine("RAlt","",{doublePress:40},{custom:Func("ru_dot")})

;   *LShift::three_symbols("{U+0449}","\","{U+0429}") ; щ  ; Щ

;   *z::ru_remap3("g","{U+0433}","{U+0413}") ; г ; Г

;   *x::ru_remap3("m","{U+043C}","{U+041C}") ; м ; М

;   *c::ru_remap3("l","{U+043B}","{U+041B}") ; л ; Л

;   *v::ru_remap3("d","{U+0434}","{U+0414}") ; д ; Д

;   *b::ru_remap3("k","{U+043A}","{U+041A}") ; к ; К

;   *`::dual.comboKey("'")

;   *F8::dual.comboKey(":",{Shift:"{U+2116}"}) ; №

;   *left::dual.comboKey("-")

;   *right::dual.comboKey("=")

;   ; LEFT THUMB CLUSTER

;   *Backspace::
;   *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

;   *LCtrl::
;   *LCtrl UP::
;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     else
;     {
;       dual.combine("F20","Tab")
;     }
;     return

;   *Delete::
;   *Delete UP::dual.combine("LShift","Enter")

;   *LAlt::dual.comboKey("Delete")

;   *Home::dual.comboKey("PgUp")

;   *End::dual.comboKey("PgDn")

;   ; RIGHT THUMB CLUSTER

;   *RWin::switch_language_main()


;   *PgUp::dual.comboKey("Delete")

;   *PgDn::
;   *PgDn UP::

;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     else
;     {
;       dual.combine("F20","",false,{custom:Func("ru_NN")})
;     }

;     return


;   *Enter::
;   *Enter UP::dual.combine("LAlt","",{doublePress: 30},{custom:Func("ru_E")})

;   *RCtrl::
;   *RCtrl UP::dual.combine("Ctrl","{Esc}",{doublePress:30},{Shift:"{U+042A}"}) ; Ъ

;   *Space::
;   *Space UP::dual.combine("RShift","Space")

;   ; ------------------------------------

;   *6::ru_number("6","{{}")

;   *7::ru_number("7","{}}")

;   *8::ru_number("8","[")

;   *9::ru_number("9","]")

;   *0::ru_number("|","0")

;   ; RIGHT NAV ROW

;   *-::dual.comboKey("CapsLock")

;   *y::three_symbols("{U+044D}",",","{U+042D}") ; э U+044D ; Э U+042D

;   *u::dual.comboKey("home")

;   *i::dual.comboKey("left")

;   *o::dual.comboKey("right")

;   *p::dual.comboKey("end")

;   *\::ru_remap3("q","{U+0446}","{U+0426}") ; ц {U+0446} ; Ц {U+0426}

;   *h::
;   *h UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("ru_H")})

;   *j::
;   *j UP::dual.combine("Ctrl","",{doublePress:30},{custom:Func("ru_N")})

;   *k::
;   *k UP::
;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     else
;     {
;       dual.combine("F20","",{doublePress:30},{custom:Func("ru_A")})
;     }
;     return

;   *l::
;   *l UP::dual.combine("LAlt","",{doublePress:30},{custom:Func("ru_O")})

;   *;::ru_remap4("r","{U+0440}","{U+0420}","4") ; р {U+0440} ; Р {U+0420}

;   *'::ru_remap4("p","{U+043F}","{U+041F}","5") ; п {U+043F} ; П {U+041F}

;   *n::constant("_","{U+044C}") ; Ь {U+044C}

;   *m::ru_remap4("w","{U+0448}","{U+0428}","6") ; ш {U+0448} ; Ш {U+0428}

;   *,::ru_remap4("u","{U+0443}","{U+0423}","7") ; у {U+0443} ; У {U+0423}

;   *.::ru_remap4("y","{U+044F}","{U+042F}","8") ; я {U+044F} ; Я {U+042F}

;   */::ru_remap4("f","{U+0424}","{U+0444}","9") ; Ф {U+0424} ; ф {U+0444}

;   *RShift::ru_remap3("j","{U+0436}","{U+0416}") ; ж {U+0436} ; Ж {U+0416}

;   *up::constant("/","?")

;   *down::constant("(","*")

;   *[::constant(")",";")

;   *]::dual.comboKey("^",{Shift:"&"})
; }

; ;-------- old keyboard -----------------

; #if (Toggle=0) ; old keyboard
; {

;   *Tab::dual.comboKey("q")

;   *q::dual.comboKey("Esc")

;   *w::dual.comboKey("x")

;   *e::dual.comboKey("up")

;   *r::dual.comboKey("down")

;   *t::
;     dual.comboKey("v",{F20:""})
;     switch_language_on_F20()
;     return

;   ; ;-------------------------

;   *y::dual.comboKey("/")

;   *u::dual.comboKey("left")

;   *i::dual.comboKey("right")

;   *o::
;   *o UP::dual.combine("LAlt","home")

;   *p::dual.comboKey("end")

;   ; ;-------------------------

;   *CapsLock::dual.comboKey("b")

;   *a::dual.comboKey("s")

;   *s::
;   *s UP::dual.combine("Shift","t")

;   *d::
;   *d UP::dual.combine("LAlt","i")

;   *f::dual.comboKey("o")

;   *g::
;     dual.comboKey("c",{F20:""})
;     switch_language_on_F20()
;     return

;   ; ;-------------------------

;   *h::dual.comboKey("h")

;   *j::dual.comboKey("n")

;   *j UP::
;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     return


;   *k::
;   *k UP::dual.combine("Shift","a")

;   *;::dual.comboKey("r")

;   *'::dual.comboKey("y")

;   ; ;-------------------------

;   *LShift::dual.comboKey(",")

;   *z::dual.comboKey("g")

;   *x::dual.comboKey("m")

;   *c::dual.comboKey("l")

;   *v::dual.comboKey("d")

;   *b::dual.comboKey("k")

;   ; ;----------------------


;   *n::dual.comboKey(".")

;   *m::dual.comboKey("w")

;   *,::dual.comboKey("u")

;   *.::dual.comboKey("p")

;   */::dual.comboKey("f")

;   *RShift::dual.comboKey("j")

;   ; ;-------------------------

;   left::dual.comboKey("(")

;   right::dual.comboKey(")")

;   ; ;-------------------------

;   up::dual.comboKey("-")

;   down::dual.comboKey("'")

;   ; ;------------------------

;   *-::dual.comboKey("Esc")

;   *F8::dual.comboKey("\")
;   ; ;-------------------------

;   ; old

;   *LCtrl::
;   *LCtrl UP::
;     if (JustToggled)
;     {
;       JustToggled := false
;       SendInput {F20 up}
;     }
;     else
;     {
;       dual.combine("F20","Delete")
;     }
;     return

;   *RWin::switch_language_main()

;   *Delete::
;   *Delete UP::dual.combine("Ctrl","Tab")

;   *Home::
;   *Home UP::dual.combine("Shift","~")

;   End::dual.comboKey(";")

;   ; ;-------------------------

;   *RCtrl::dual.comboKey("z")

;   *Enter::
;   *Enter UP::dual.combine("Shift","Enter")

;   *Space::
;   *Space UP::dual.combine("Ctrl","Space")

;   ; ;--------------------------

;   *l::
;   *l UP::dual.combine("RAlt","e")
; }

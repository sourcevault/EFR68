#InputLevel 2
SendLevel 2

#NoEnv
#SingleInstance force

SendMode Input

#Include <dual/dual>

dual := new Dual({delay: 70, timeout: 300, doublePress: 200, specificDelays: false})

#Include loc.ahk

#Include <dual/defaults>

#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.

*F12::dual.reset()

;-------------RUSSIAN---------------

#if (Toggle=1) ; RU
{


  ; RIGHT THUMB CLUSTER

  *=::dual.comboKey("``")

  ; Left - TOP ROW

  *1::ru_number("0","|")

  *2::ru_number("1","(")

  *3::ru_number("2",")")

  *4::ru_number("3","{U+007B}") ; {

  *5::ru_number("4","{U+007D}") ; }

  *6::ru_number("5","<")

  *7::ru_number("6",">")

  *8::ru_number_symbol("7","[","{U+2116}") ; №

  *9::ru_number_symbol("8","]","~")

  *0::ru_number("9","{!}")

  *-::dual.comboKey("CapsLock")

  ; Left - NAV ROW

  *Tab::constant("_","$")

  *q::ru_remap3("z","{U+0437}","{U+0417}") ; з ; З

  *w::dual.comboKey("up")

  *e::dual.comboKey("down")
  
  *r::ru_remap3("v","{U+0431}","{U+0411}") ; б U+0431 ;Б U+0411

  *t::
    ru_remap3_20fsilent("x","{U+044E}","{U+042E}")  ; ю ; Ю
    switch_language_on_F20()
    return

  ; Left - HOME ROW

  *CapsLock::ru_remap3("b","{U+0432}","{U+0412}") ; в ; В

  *a::ru_remap3("s","{U+0441}","{U+0421}") ; с ; С

  *s::ru_remap3("t","{U+0442}","{U+0422}") ; т ; Т

  *d::ru_remap3("i","{U+0438}","{U+0418}") ; и ; И

  *f::
  *f UP::
    my_combine(Loc.RU_C)
    return

  *g::
  *g UP::
    dual.combine("Alt",".",{delay:70,doublePress:70,timeout:400},{Shift:["{Shift UP}","{U+042B}"]}) ; Ы
    return

  *LShift::ru_remap3("\","{U+0449}","{U+0429}") ; щ  ; Щ

  *z::ru_remap3("g","{U+0433}","{U+0413}") ; г ; Г

  *x::ru_remap3("m","{U+043C}","{U+041C}") ; м ; М

  *c::ru_remap3("l","{U+043B}","{U+041B}") ; л ; Л

  *v::ru_remap3("d","{U+0434}","{U+0414}") ; д ; Д

  *b::ru_remap3("k","{U+043A}","{U+041A}") ; к ; К

  *`::dual.comboKey("'")

  *F8::
  *F8 UP::double_qoute_accent()

  *left::dual.comboKey("-",{Shift:"@"})

  *right::dual.comboKey("+",{Shift:"%"})

  ; LEFT THUMB CLUSTER

  *Backspace::
  *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

  *LCtrl::
  *LCtrl UP::
    if (JustToggled)
    {
      JustToggled := false
      SendInput {F20 up}
    }
    else
    {
      dual.combine("F20","Enter")
    }
    return

  *Delete::
  *Delete UP::

    dual.combine("LShift","Tab")

    return

  *LAlt::dual.comboKey("Delete")

  *Home::
  *Home UP::dual.combine("LAlt","PgUp",{doublePress:250})

  *End::dual.comboKey("PgDn")

  ; RIGHT THUMB CLUSTER

  *PgUp::
  *PgUp UP::my_combine(Loc.NN)

  *PgDn::dual.comboKey("/")

  *RWin::switch_language_main()

  *RCtrl::
  *RCtrl UP::dual.combine("Ctrl","{Esc}",{doublePress:250},{Shift:"{U+042A}"})

  *Enter::
  *Enter UP::
    dual.combine("Alt","e",{delay: 70,doublePress: 70},{F21:""})
    ru_e()
    return

  *Space::
  *Space UP::dual.combine("RShift","Space")

  ; ------------------------------------

  ; RIGHT NAV ROW

  *y::ru_symbol_and_letter(",","{U+044D}","{U+042D}") ; э U+044D ; Э U+042D

  *u::dual.comboKey("home")

  *i::dual.comboKey("left")

  *o::dual.comboKey("right")

  *p::dual.comboKey("end")

  *\::ru_remap3("q","{U+0446}","{U+0426}") ; ц {U+0446} ; Ц {U+0426}

  *h::
  *h UP::ru_H()
  
  *j::ru_remap4("n","{U+043D}","{U+041D}","1") ; н {U+043D} ; Н {U+041D}

  *k::ru_remap4("a","{U+0430}","{U+0410}","2") ; а {U+0430} ; А {U+0410}

  *l::ru_remap4("o","{U+043E}","{U+041E}","3") ; о {U+043E} ; О {U+041E}
  *;::ru_remap4("r","{U+0440}","{U+0420}","4") ; р {U+0440} ; Р {U+0420}

  *'::ru_remap4("p","{U+043F}","{U+041F}","5") ; п {U+043F} ; П {U+041F}

  *n::constant("=","{U+042C}") ; Ь {U+042C}

  *m::ru_remap4("w","{U+0448}","{U+0428}","6") ; ш {U+0448} ; Ш {U+0428}

  *,::ru_remap4("u","{U+0443}","{U+0423}","7") ; у {U+0443} ; У {U+0423}

  *.::ru_remap4("y","{U+044F}","{U+042F}","8") ; я {U+044F} ; Я {U+042F}

  */::ru_remap4("f","{U+0424}","{U+0444}","9") ; Ф {U+0424} ; ф {U+0444}

  *RShift::ru_remap3("j","{U+0436}","{U+0416}") ; ж {U+0436} ; Ж {U+0416}

  *up::constant(";","?")

  *down::constant(":","*")

  *[::constant("{#}","&")

  *]::dual.comboKey("^")

}

;-------- old keyboard ------------

#if (Toggle=0) ; old keyboard
{

  *Tab::dual.comboKey("q")

  *q::dual.comboKey("Esc")

  *w::dual.comboKey("x")

  *e::dual.comboKey("up")

  *r::dual.comboKey("down")

  *t::
    dual.comboKey("v",{F20:""})
    switch_language_on_F20()
    return

  ; ;-------------------------

  *y::dual.comboKey("/")

  *u::dual.comboKey("left")

  *i::dual.comboKey("right")

  *o::
  *o UP::dual.combine("LAlt","home")

  *p::dual.comboKey("end")

  ; ;-------------------------

  *CapsLock::dual.comboKey("b")

  *a::dual.comboKey("s")

  *s::
  *s UP::dual.combine("Shift","t")

  *d::
  *d UP::dual.combine("LAlt","i")

  *f::dual.comboKey("o")

  *g::
    dual.comboKey("c",{F20:""})
    switch_language_on_F20()
    return

  ; ;-------------------------

  *h::dual.comboKey("h")

  *j::dual.comboKey("n")


  *k::
  *k UP::dual.combine("Shift","a")

  *;::dual.comboKey("r")

  *'::dual.comboKey("y")

  ; ;-------------------------

  *LShift::dual.comboKey(",")

  *z::dual.comboKey("g")

  *x::dual.comboKey("m")

  *c::dual.comboKey("l")

  *v::dual.comboKey("d")

  *b::dual.comboKey("k")

  ; ;----------------------


  *n::dual.comboKey(".")

  *m::dual.comboKey("w")

  *,::dual.comboKey("u")

  *.::dual.comboKey("p")

  */::dual.comboKey("f")

  *RShift::dual.comboKey("j")

  ; ;-------------------------

  left::dual.comboKey("(")

  right::dual.comboKey(")")

  ; ;-------------------------

  up::dual.comboKey("-")
  down::dual.comboKey("'")

  ; ;------------------------

  *-::dual.comboKey("Esc")

  *F8::dual.comboKey("\")
  ; ;-------------------------

  ; old

  *LCtrl::
  *LCtrl UP::
    if (JustToggled)
    {
      JustToggled := false
      SendInput {F20 up}
    }
    else
    {
      dual.combine("F20","Delete")
    }
    return

  *RWin::switch_language_main()

  *Delete::
  *Delete UP::dual.combine("Ctrl","Tab")

  *Home::
  *Home UP::dual.combine("Shift","~")

  End::dual.comboKey(";")

  ; ;-------------------------

  *RCtrl::dual.comboKey("z")

  *Enter::
  *Enter UP::dual.combine("Shift","Enter")

  *Space::
  *Space UP::dual.combine("Ctrl","Space")

  ; ;--------------------------

  *l::
  *l UP::dual.combine("LAlt","e")

}

;------------------French -------------------- 

#if (Toggle=2) ; French Keyboard
{

  *=::
  *= UP::grave_accent()

  *1::ru_number("0","|")

  *2::ru_number("1","(")

  *3::ru_number("2",")")

  *4::ru_number("3","{U+007B}") ; {

  *5::ru_number("4","{U+007D}") ; }

  *6::ru_number("5","<")

  *7::ru_number("6",">")

  *8::ru_number("7","[")

  *9::ru_number_symbol("8","]","~")

  *0::ru_number("9","{!}")

  *-::dual.comboKey("CapsLock")

  ; ; ----------

  *Tab::constant("_","$")

  *q::dual.comboKey("z")

  *w::dual.comboKey("up")

  *e::dual.comboKey("down")

  *r::dual.comboKey("v")

  *t::
    dual.comboKey("x",{F20:""})
    switch_language_on_F20()
    return

  ; ;-------------------------

  *CapsLock::dual.comboKey("b")

  *a::dual.comboKey("s")

  *s::dual.comboKey("t")

  *d::
    dual.combo("")
    accent_letter(Loc.I)
    return

  *f::
    dual.combo("")
    accent_letter(Loc.C)
    return

  *g::
  *g UP::
    dual.combine("Alt",".")
    return

  ; ;-------------------------

  *LShift::dual.comboKey("\")

  *z::dual.comboKey("g")

  *x::dual.comboKey("m")

  *c::dual.comboKey("l")

  *v::dual.comboKey("d")

  *b::dual.comboKey("k")

  ; ;-------------------------

  *`::
  *` UP::single_qoute_accent()

  *F8::
  *F8 UP::double_qoute_accent()

  *left::dual.comboKey("-",{Shift:"@"})

  *right::dual.comboKey("+",{Shift:"%"})

  ; ;-------------------------

  *y::dual.comboKey(",")

  *u::dual.comboKey("home")

  *i::dual.comboKey("left")

  *o::dual.comboKey("right")

  *p::dual.comboKey("end")

  *\::dual.comboKey("q")

  ; ;-------------------------

  *h::
  *h UP::dual.combine("LAlt","h",{doublePress:70},{LShift:["{Shift Up}",0]})

  *j::fr_remap2("n",1)

  *k::
    dual.combo("")
    accent_letter(Loc.A)
    return

  *l::
    dual.combo("")
    accent_letter(Loc.O)
    return


  *;::fr_remap2("r",4)

  *'::fr_remap2("p",5)

  ; ; -------------------------

  *n::dual.comboKey("=")

  *m::fr_remap2("w",6)


  *,::
    dual.combo("")
    accent_letter(Loc.U)
    return

  *.::fr_remap2("y",8)

  */::fr_remap2("f",9)

  *RShift::dual.comboKey("j")

  ; ;------------------------

  *up::dual.comboKey(";",{Shift:"?"})

  *down::dual.comboKey(":",{Shift:"*"})

  *[::dual.comboKey("{#}",{Shift:"&"})

  *]::
  *] UP::hat_accent()

  ; ;-------------------------

  ; LEFT THUMB CLUSTER (COPIED)

  *Backspace::
  *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

  *LCtrl::
  *LCtrl UP::

    if (JustToggled)
    {
      JustToggled := false
      SendInput {F20 up}
    }
    else
    {
      dual.combine("F20","Enter")
    }

    return

  *Delete::
  *Delete UP::dual.combine("LShift","Tab")

  ; ;-------------------------

  *LAlt::dual.comboKey("Delete")

  *Home::
  *Home UP::dual.combine("LAlt","PgUp",{doublePress:250})

  *End::dual.comboKey("PgDn")

  ; RIGHT THUMB CLUSTER

  *RWin::switch_language_main()

  *PgUp::
  *PgUp UP::my_combine(Loc.EE)

  *PgDn::dual.combo("/")

  *RCtrl::
  *RCtrl UP::dual.combine("Ctrl","{Esc}",{doublePress:250})

  *Enter::
  *Enter UP::

    dual.combine("Alt","e",{doublePress:250,timeout:200,delay:20},{F21:""})

    accent_letter_with_mod(Loc.E)

    return

  *Space::
  *Space UP::dual.combine("RShift","Space")

  ; ------------------------------------

}


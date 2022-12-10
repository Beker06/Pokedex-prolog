:- use_module(library(pce)).
:- pce_image_directory('./imagenes').
:- use_module(library(pce_style_item)).
:- dynamic color/2.


resource(bulbasaur, image, image('001Bulbasaur.png')).
resource(ivysaur, image, image('002Ivysaur.png')).
resource(venusaur, image, image('003Venusaur.png')).
resource(bulbasaur, image, image('004Charmander.png')).
resource(bulbasaur, image, image('005Charmeleon.png')).
resource(bulbasaur, image, image('006CHarizard.png')).

mostrar_imagen(Pantalla, Imagen) :- new(Figura, figure),
   new(Bitmap, bitmap(resource(Imagen),@on)),
   send(Bitmap, name, 1),
   send(Figura, display, Bitmap),
   send(Figura, status, 1),
   send(Pantalla, display,Figura,point(0,0)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
botones:-borrado,
   send(@boton, free),
   send(@btntratamiento,free),
   mostrar_diagnostico(Enfermedad),
   send(@texto, selection('El Diagnostico a partir de los datos es:')),
   send(@resp1, selection(Enfermedad)),
   new(@boton, button('Iniciar consulta',
   message(@prolog, botones)
   )),

   new(@btntratamiento,button('Detalles y Tratamiento',
   message(@prolog, mostrar_tratamiento,Enfermedad)
   )),
   send(@main, display,@boton,point(20,450)),
   send(@main, display,@btntratamiento,point(138,450)).

mostrar_tratamiento(X):-new(@tratam, dialog('Tratamiento')),
                        %send(@tratam, append, label(nombre, 'Explicacion: ')),
                        send(@tratam, display,@lblExp1,point(70,5)),
                        send(@tratam, display,@lblExp2,point(50,80)),
                        send(@tratam, display,@r1,point(15,25)),
                        send(@tratam, display,@r2,point(15,40)),
                        send(@tratam, display,@r3,point(15,55)),
                        send(@tratam, display,@r4,point(15,70)),
                        send(@tratam, display,@r5,point(15,85)),
                        send(@tratam, display,@r6,point(15,100)),
                        send(@tratam, display,@r7,point(15,115)),
                        send(@tratam, display,@r8,point(15,130)),
                        send(@tratam, display,@r9,point(15,145)),
                        tratamiento(X),
                        send(@tratam, transient_for, @main),
                        send(@tratam, open_centered).
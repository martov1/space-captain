----- TO DO----

elementary gui for navegation







----- COSAS HECHAS------

clases functions

        -instance_create (){
        
        crea una instancia, se guarda en 
        active_instances[id], a medida que creas instancias id aumenta 1
        }
        -instance_destroy (id){
        
        destruye el objeto guardado en
        active_instances(id) transformandolo en nil
        }
        instance_modify (id, "variable", "newvalue"){
        
        modifica una variable 
        de la instancia guardada en active_instances[id] NOT DONE}
        
        show_loaded_clases() {
        shows loaded clases}
        shows the loaded clases
        }
        
        tests() {
          runs show_loaded_clases()}
        
        
        load_clases () {
        carga en memoria los .lua que estan en la carpeta clases y almacena sus nombres en "clases_list", tambien guarda sus nombres completos con path (ejemplo clases/soldado.lua) en "clases_loader"
      }
      
        instance_show (someid) {
          te muestra los datos de la instancia con ese ID
          }
        set_gui (name_of_gui) {
          hace que el estado de gui sea name_of_gui, solo los objetos de 
          loveframes con "main_tabs:SetState("name_of_gui")"seran mostrados en
          pantalla
          
        }
        
        load_guis(){
        loads all love files in the folder /guis  
        }
        
        a
        
        
        
        
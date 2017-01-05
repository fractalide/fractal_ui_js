{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; with edges; ''
   td(${flex}) output -> input page(${page})
   '${ui_js_create}:(type="div", style=[(key="display", val="flex"), (key="flex-direction", val="column")])~create' -> input td()

   lr(${flex}) output -> places[1] td()
   '${ui_js_create}:(type="div", style=[(key="display", val="flex")])~create' -> input lr()

   button_add(${tag}) output -> places[1] lr()
   button_remove(${tag}) output -> places[2] lr()
   '${ui_js_create}:(type="button", text="add")~create' -> input button_add()
   '${ui_js_create}:(type="button", text="remove")~create' -> input button_remove()

   dummy()

   gflex(${growing_flex}) output -> places[2] td()
   gflex() scheduler -> action sched(${core_subgraph})
   sched() outputs[flex] -> places[2] td()
   '${prim_text}:(text="${app_counter_card}")' -> option gflex()
   '${ui_js_create}:(type="div", style=[(key="display", val="flex"), (key="flex-direction", val="column")])~create' -> input gflex()

   button_add() output[click] -> input add(${msg_replace}) output -> input gflex()
   button_remove() output[click] -> input minus(${msg_action}) output -> input gflex()
   '${prim_text}:(text="remove")' -> option minus()
   '${ui_app_counter}:(value=0)~add' -> option add()

   '';
}

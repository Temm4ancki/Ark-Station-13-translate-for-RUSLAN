/obj/item/circuitboard/machine/autodoc
	name = "Autodoc"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/autodoc
	req_components = list(
		/obj/item/scalpel/advanced = 1,
		/obj/item/retractor/advanced = 1,
		/obj/item/surgicaldrill = 1,
		/obj/item/stack/sheet/glass = 1,
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/servo = 1)
	def_components = list(/obj/item/stock_parts/cell = /obj/item/stock_parts/cell/high)
	needs_anchored = FALSE

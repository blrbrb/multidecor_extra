multidecor_extra = {}
multidecor_extra.S = minetest.get_translator("multidecor_extra")

-- register a new furniture style for the outdoor picnic bench
multidecor.register.register_type("garden")


minetest.register_node("multidecor_extra:weather_vane", {
    description = "Weather Vane",
    drawtype = "mesh",
    mesh = "weather_vane.obj",                                       -- Path to the .obj file (placed in models/)
    tiles = { "weather_vane_tex.png" },                              -- Texture for the node
    paramtype = "light",
    light_source = 5,                                                -- Optional: if you want the weather vane to emit light
    groups = { snappy = 1, racky = 3, oddly_breakable_by_hand = 3 }, -- Node behavior
    visual_scale = 0.1,
    inventory_image = "weather_vane.png",
    is_ground_content = false
})

multidecor.register.register_light("ceiling_lamp_modern_round_off", {
        style = "modern",
        material = "glass",
        visual_scale = 1.2,
        description = multidecor_extra.S("Modern Round Ceiling Lamp"),
        mesh = "ceiling_lamp_modern_round.obj",
        texture = "ceiling_lamp_modern_round_diff.jpg",
        tiles = { "ceiling_lamp_modern_round_diff.jpg" },
        bounding_boxes = { { -0.225, 1.4, -0.225, 0.225, 0.33, 0.225 } }
    },
    {
        swap_light = {
            name = "ceiling_lamp_modern_round_on",
            light_level = 12,
        }
    },
    {
        recipe = {
            { "multidecor:steel_stripe", "xpanes:pane_flat", "" },
            { "multidecor:wolfram_wire", "",                 "" },
            { "",                        "",                 "" }
        },
        replacements = { { "multidecor:steel_scissors", "multidecor:steel_scissors" } }
    })

multidecor.register.register_light("classic_streetlamp_off", {
        style = "classic",
        material = "metal",
        visual_scale = 1.2,
        description = multidecor_extra.S("Modern Round Ceiling Lamp"),
        mesh = "classic_streetlamp.obj",
        use_texture_alpha = "blend",
        texture = "classic_streetlamp_diff.png",
        paramtype2 = "colorfacedir",
        tiles = { "classic_streetlamp_diff.png" },
        bounding_boxes = { { -0.225, 3.25, -0.225, 0.225, -0.25, 0.225 }, { -0.25, 3.25, -0.25, 0.25, 4.25, 0.25 } },
        mod_origin = "multidecor_extra"
    },
    {
        swap_light = {
            name = "classic_streetlamp_on",
        }
    },
    {
        recipe = {
            { "multidecor:steel_stripe", "xpanes:pane_flat",        "multidecor:steel_stripe" },
            { "mulidecor:steel_stripe",  "multidecor:wolfram_wire", "multidecor:steel_stripe" },
            { "",                        "multidecor:steel_bar",    "" }
        },
        replacements = { { "multidecor:steel_scissors", "multidecor:steel_scissors" } }
    })
multidecor.register.register_furniture_unit("potted_aloe", {
        type = "garden",
        style = "modern",
        material = "plastic",
        description = "Potted Aloe",
        visual_scale = 2,
        mesh = "potted_aloe.obj",
        texture = "potted_aloe_diff.jpg",
        tiles = { "potted_aloe_diff.jpg" },
        bounding_boxes = { { -0.17, -0.45, -0.2, 0.17, 0.01, 0.2 } },
    },
    {
        recipe = {
            { "multidecor:plastic_strip", "default:dirt",             "multidecor:plastic_strip" },
            { "",                         "multidecor:plastic_sheet", "" },
            { "",                         "",                         "" }
        }

    })
-- Optional: Add a craft recipe to create the weather vane

multidecor.register.register_seat("wooden_picnic_table", {
        type = "garden",
        style = "classic",
        material = "wood",
        description = multidecor_extra.S("Wooden Picnic Table"),
        drawtype = mesh,
        visual_scale = 1,
        mesh = "wooden_picnic_table.obj",
        node_box = { type = "regular" },
        texture = "wooden_picnic_table_top_diff_1k.png",
        inventory_image = "wooden_picnic_bench_icon.png",
        tiles = { "wooden_picnic_table_top_diff_1k.png" },
        selection_box = {
            { -0.20, -0.30, -1.45, 0.75, 0.75, 1.50 }
        },
        bounding_boxes = { { -0.57, -0.0, -1.45, 0.57, 0.25, 1.50 } }
    },
    {
        seat_data = {
            pos = { x = -1.0, y = -0.12, z = 1.0 },
            rot = { x = 0, y = 90, z = 0 },
            model = multidecor.sitting.standard_model,
            anims = { "sit1" }
        },

    },
    {
        recipe = {
            { "multidecor:plank", "multidecor:plank", "multidecor:plank" },
            { "default:stick",    "",                 "default:stick" },
            { "multidecor:plank", "",                 "multidecor:plank" }
        }
    })



multidecor.register.register_table("ironwood_shelves", {
        style = "modern",
        material = "wood",
        visual_scale = 1,
        description = multidecor_extra.S("Ironwood Shelves"),
        mesh = "ironwood_shelves.obj",
        tiles = { "ironwood_shelves_diff.jpg" },
        bounding_boxes = { { -0.55, -0.7, -0.25, 0.55, 1.22, 0.25 } },
        callbacks = {
            on_construct = multidecor.shelves.default_on_construct,
            on_rightclick = multidecor.shelves.default_on_node_rightclick,
            can_dig = multidecor.shelves.default_can_dig,
            on_receive_fields = multidecor.shelves.default_on_receive_fields,
            on_destruct = multidecor.shelves.default_on_destruct
        }
    },
    {
        shelves_data = {
            common_name = "ironwood_shelves",
            {
                inv_size = { w = 8, h = 3 }
            }
        }
    },
    {
        recipe = {
            { "multidecor:plank", "multidecor:board", "multidecor:plank" },
            { "multidecor:plank", "multidecor:board", "multidecor:plank" },
            { "",                 "multidecor:board", "" }
        }
    })

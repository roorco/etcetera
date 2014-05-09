# This is a python script. Pay attention to the syntax and indentation
import state
import tile

bindings = {
# You can use Control and Shift. Alt is Mod1, Super is Mod4.

#Available commands :
# tile: start tiling
# untile: stop tiling and move the windows back to their original position
# cycle: switch between horizontal and vertical tiling

# increase_master: increase the space allocated to master windows
# decrease_master: increase the space allocated to slave windows
# add_master: send a window from the slave group to the master group
# remove_master: send a window from the master group to the slave group

# prev_client: Focus the previous window
# next_client: Focus the next window
# focus_master: Focus the master window

# switch_prev_client: switch active window with previous
# switch_next_client: switch active window with next
# rotate: shift all windows' positions (clockwise)
# make_master: send active window to the master position

	'Control-Mod4-h': tile.cmd('tile'),
        'Control-Mod1-h': tile.cmd('untile'),
        'Control-Mod1-m': tile.cmd('decrease_master'),
        'Control-Mod4-m': tile.cmd('increase_master'),
        'Control-Mod1-n': tile.cmd('remove_master'),
        'Control-Mod4-n': tile.cmd('add_master'),
	'Control-Mod4-r': tile.cmd('rotate'),
        'Control-Mod4-Tab': tile.cmd('cycle'),
        'Control-Mod4-z': tile.cmd('toggle_float'),

# quit pytyle
    'Control-Mod4-q': state.quit,
}


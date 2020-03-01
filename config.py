###################################################
##################### My qTile ####################
###################################################

# Importing python/qtile libraries:

import os
import re
import socket
import subprocess
import os.path
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer, base
from typing import List  # noqa: F401

# Set Default modkey:
mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("alacritty")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
]

groups = [
    Group(
        "1",
        label="I"
    ),
    Group(
        "2",
        label="II"
    ),
    Group(
        "3",
        label="III"
    ),
    Group(
        "4",
        label="IV"
    ),
    Group(
        "5",
        label="V"
    ),
    Group(
        "6",
        label="VI"
    ),
    Group(
        "7",
        label="VII"
    ),
    ]




for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.MonadTall(
        border_focus = "5e81ac",
        border_normal = "b48ead",
        border_width = 3,
        margin = 5,
    ),
    layout.MonadWide(
        border_focus = "5e81ac",
        border_normal = "b48ead",
        border_width = 3,
        margin = 5,
    ),
    layout.Max(),
    layout.Matrix(),
]

widget_defaults = dict(
    font='Cascadia Code',
    fontsize=14,
    padding=4,
    background="2e3440",
    foreground="5e81ac",
)
extension_defaults = widget_defaults.copy()

def get_bar():
    return bar.Bar([
       widget.GroupBox(
           active = "5e81ac",
           inactive = "b48ead",
           this_current_screen_border = "bf616a",
           highlight_method = "line",
           highlight_color=["2e3440", "2e3440"],
           center_aligned=True,
       ),
       widget.Prompt(
           prompt='Run:',
       ),
       widget.TextBox(
           text='|',
           foreground="bf6a6a"
       ),
       #widget.TaskList(
       #    foreground = "2e3440",
       #    border = "5e81ac",
       #    fontsize = 11,
       #    unfocused_border = "b48ead",
       #    highlight_method = "block",
       #    max_title_width=100,
       #    title_width_method="uniform",
       #    icon_size = 13,
       #    rounded=False,
       #),
       widget.Spacer(bar.STRETCH),
       widget.Systray(
       ),
       widget.TextBox(
           text='|',
           foreground="8fbcbb",
       ),
       widget.TextBox(
           text='Battery',
           foreground="5e81ac",
       ),
       widget.Battery(
           format = '{percent:2.0%}'
       ),
       widget.TextBox(
           text='|',
           foreground="ebcb8b",
       ),
       widget.TextBox(
           text='Volume',
           foreground="ebcb8b",
       ),
       widget.Volume(
           foreground="ebcb8b",
       ),
       widget.TextBox(
           text='|',
           foreground="88c0d0",
       ),
       widget.TextBox(
           text='Backlight',
           foreground="88c0d0",
       ),
       widget.Backlight(
           foreground="88c0d0",
           backlight_name="acpi_video0",
           brightness_file="actual_brightness"
       ),
       widget.TextBox(
           text='|',
           foreground="a3be8c",
       ),
       widget.TextBox(
           text='Date',
           foreground="a3be8c",
       ),
       widget.Clock(
           format='%a %I:%M',
           foreground = "a3be8c",
       ),
       widget.TextBox(
           text='|',
           foreground="bf6a6a",
       ),
       widget.TextBox(
           text='Wifi',
           foreground="bf6a6a",
       ),
       widget.Wlan(
           foreground="bf6a6a",
           interface="wlp3s0",
           format="{essid}",
       ),
    ], 26, background="2e3440")


screens = [
    Screen(top=get_bar()),
    Screen(),
]
            
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

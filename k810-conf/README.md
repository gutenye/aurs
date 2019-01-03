k810-conf
==========

**Homepage**: http://www.trial-n-error.de/posts/2012/12/31/logitech-k810-keyboard-configurator/

## USAGE

**Manually**

```
$ sudo k810-conf -d /dev/`grep -H "Logitech K810" /sys/class/hidraw/hidraw*/device/uevent | cut -d/ -f 5` -f on
```

**Use udev rules** (Automatically set when K810 is connected)

```
$ journalctl -k | grep "Logitech K810"
> hid-generic 0005:046D:B319.0004: input,hidraw3: BLUETOOTH HID v12.02 Keyboard [Logitech K810] on 00:1a:7d:da:71:11
# edit /etc/udev/rules.d/10-k810-conf.rules

    ..., ATTRS{address}=="00:1a:7d:da:71:11", ...    # replace 00:1a:7d:da:71:11 with your own value from above
```

# GOAL: system should not use Suspend anymore. Always use Hybrid Sleep and Suspend-Then-Hibernate. Use Hibernate when power key is hit. Use Suspend-Then-Hibernate when lid is closed.  
#
# follow https://wiki.archlinux.org/title/Power_management#Hybrid-sleep_on_suspend_or_hibernation_request
# follow https://man.archlinux.org/man/sleep.conf.d.5
# 
# Disable regular suspend, we only allow Hybrid Sleep, to prevent data loss when battery dies
sed -i -e 's@#AllowSuspend=yes@AllowSuspend=no@g' /etc/systemd/sleep.conf
# Disabling suspend implies disabling suspend-then-hibernate and hybrid-sleep, override to allow both again
sed -i -e 's@#AllowHybridSleep=yes@AllowHybridSleep=yes@g' /etc/systemd/sleep.conf
sed -i -e 's@#AllowSuspendThenHibernate=yes@AllowSuspendThenHibernate=yes@g' /etc/systemd/sleep.conf
# Define the method of suspend to be Hybrid Sleep, this is also used by suspend-then-hibernate to determine how to suspend.
sed -i -e 's@#SuspendMode=@SuspendMode=suspend@g' /etc/systemd/sleep.conf
sed -i -e 's@#SuspendState=mem standby freeze@SuspendState=disk@g' /etc/systemd/sleep.conf
# when suspend-then-hibernate is used, go into hibernation (0.0 power consumption) after 60min of suspend unless interrupted
sed -i -e 's@#HibernateDelaySec=180min@HibernateDelaySec=60min@g' /etc/systemd/sleep.conf

# Now define what to do on user initiated actions: go into hibernation when hitting power key
sed -i -e 's@#HandlePowerKey=poweroff@HandlePowerKey=hibernate@g' /etc/systemd/logind.conf
# Use suspend-then-hibernate when lid is closed, even when on external power since you could disconnect from power during suspend
sed -i -e 's@HandleLidSwitch=ignore@HandleLidSwitch=suspend-then-hibernate@g' /etc/systemd/logind.conf
sed -i -e 's@#HandleLidSwitchExternalPower=suspend@HandleLidSwitchExternalPower=suspend-then-hibernate@g' /etc/systemd/logind.conf

zero_device_thttpd_t▒▒|▒#@@@@@@@@@@@@@@@@@@@@@@chr_filobject_r
# Directory patterns (dir)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. directory type
#




























#
# Regular file patterns (file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#




































#
# Symbolic link patterns (lnk_file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#


























#
# (Un)named Pipes/FIFO patterns (fifo_file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#


























#
# (Un)named sockets patterns (sock_file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#
























#
# Block device node patterns (blk_file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#


























#
# Character device node patterns (chr_file)
#
# Parameters:
# 1. domain type
# 2. container (directory) type
# 3. file type
#


























#
# File type_transition patterns
#
# filetrans_add_pattern(domain,dirtype,newtype,class(es),[filename])
#


#
# filetrans_pattern(domain,dirtype,newtype,class(es),[filename])
#



#
# unix domain socket patterns
#



########################################
#
# Support macros for sets of object classes and permissions
#
# This file should only have object class and permission set macros - they
# can only reference object classes and/or permissions.

#
# All directory and file classes
#


#
# All non-directory file classes.
#


#
# Non-device file classes.
#


#
# Device file classes.
#


#
# All socket classes.
#


#
# Datagram socket classes.
#


#
# Stream socket classes.
#


#
# Unprivileged socket classes (exclude rawip, netlink, packet).
#


########################################
#
# Macros for sets of permissions
#

#
# Permissions to mount and unmount file systems.
#


#
# Permissions for using sockets.
#


#
# Permissions for creating and using sockets.
#


#
# Permissions for using stream sockets.
#


#
# Permissions for creating and using stream sockets.
#


#
# Permissions for creating and using sockets.
#


#
# Permissions for creating and using sockets.
#



#
# Permissions for creating and using netlink sockets.
#


#
# Permissions for using netlink sockets for operations that modify state.
#


#
# Permissions for using netlink sockets for operations that observe state.
#


#
# Permissions for sending all signals.
#


#
# Permissions for sending and receiving network packets.
#


#
# Permissions for using System V IPC
#










########################################
#
# New permission sets
#

#
# Directory (dir)
#















#
# Regular file (file)
#


























#
# Symbolic link (lnk_file)
#














#
# (Un)named Pipes/FIFOs (fifo_file)
#















#
# (Un)named Sockets (sock_file)
#














#
# Block device nodes (blk_file)
#















#
# Character device nodes (chr_file)
#















########################################
#
# Special permission sets
#

#
# Use (read and write) terminals
#



#
# Sockets
#



#
# Keys
#


#
# Service
#

#
# Specified domain transition patterns
#


# compatibility:




#
# Automatic domain transition patterns
#


# compatibility:




#
# Dynamic transition pattern
#


#
# Other process permissions
#








































































































































########################################
#
# Helper macros
#

#
# shiftn(num,list...)
#
# shift the list num times
#


#
# ifndef(expr,true_block,false_block)
#
# m4 does not have this.
#


#
# __endline__
#
# dummy macro to insert a newline.  used for
# errprint, so the close parentheses can be
# indented correctly.
#


########################################
#
# refpolwarn(message)
#
# print a warning message
#


########################################
#
# refpolerr(message)
#
# print an error message.  does not
# make anything fail.
#


########################################
#
# gen_user(username, prefix, role_set, mls_defaultlevel, mls_range, [mcs_categories])
#


########################################
#
# gen_context(context,mls_sensitivity,[mcs_categories])
#

########################################
#
# can_exec(domain,executable)
#


########################################
#
# gen_bool(name,default_value)
#

########################################
#
# gen_cats(N)
#
# declares categores c0 to c(N-1)
#




########################################
#
# gen_sens(N)
#
# declares sensitivites s0 to s(N-1) with dominance
# in increasing numeric order with s0 lowest, s(N-1) highest
#






########################################
#
# gen_levels(N,M)
#
# levels from s0 to (N-1) with categories c0 to (M-1)
#




########################################
#
# Basic level names for system low and high
#





########################################
#
# Macros for switching between source policy
# and loadable policy module support
#

##############################
#
# For adding the module statement
#


##############################
#
# For use in interfaces, to optionally insert a require block
#


# helper function, since m4 wont expand macros
# if a line is a comment (#):

##############################
#
# In the future interfaces should be in loadable modules
#
# template(name,rules)
#


##############################
#
# In the future interfaces should be in loadable modules
#
# interface(name,rules)
#




##############################
#
# Optional policy handling
#


##############################
#
# Determine if we should use the default
# tunable value as specified by the policy
# or if the override value should be used
#


##############################
#
# Extract booleans out of an expression.
# This needs to be reworked so expressions
# with parentheses can work.



##############################
#
# Tunable declaration
#


##############################
#
# Tunable policy handling
#

include $(THEOS)/makefiles/common.mk

ARCHS = arm64

#export TARGET = iphone:clang:8.1:8.1

TOOL_NAME = ofilza
$(TOOL_NAME)_FILES = main.mm
$(TOOL_NAME)_CFLAGS = -fobjc-arc
$(TOOL_NAME)_FRAMEWORKS = UIKit MobileCoreServices

include $(THEOS_MAKE_PATH)/tool.mk


runn::
	./.theos/obj/debug/ofilza


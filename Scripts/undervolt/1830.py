#!/usr/bin/env python

from pynvml import *
nvmlInit()
myGPU = nvmlDeviceGetHandleByIndex(0)
nvmlDeviceSetGpcClkVfOffset(myGPU,130)
nvmlDeviceSetGpuLockedClocks(myGPU,210,1830)
nvmlDeviceSetPowerManagementLimit(myGPU, 100000)

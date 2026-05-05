#!/usr/bin/env python

from pynvml import *
nvmlInit()
myGPU = nvmlDeviceGetHandleByIndex(0)
nvmlDeviceSetGpcClkVfOffset(myGPU,0)
nvmlDeviceSetGpuLockedClocks(myGPU,210,1950)
nvmlDeviceSetPowerManagementLimit(myGPU, 125000)

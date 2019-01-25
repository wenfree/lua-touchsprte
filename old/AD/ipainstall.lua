


path = '/private/var/mobile/Media/baidu.ipa'
flag = ipaInstall(path)


times = os.time()



nLog(times)



nLog(flag)

mSleep(1000)

timeline = os.time()-times

nLog(timeline)
nLog(os.time())
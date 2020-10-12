import multiprocessing # use for cpu (processing) OR i/o (file system, network ops) bound tasks
import threading # use for i/o bound tasks only
import time


def do_something(seconds):
    print(f'sleeping {seconds} second')
    time.sleep(seconds)
    print('done sleeping')
    return f'done sleeping {seconds} seconds'

### multiprocessing & concurrent ###
start = time.perf_counter()

# step 1 - linear processing
# do_something()
# do_something()

# step 2 - basic multiprocessing
# p1 = multiprocessing.Process(target=do_something)
# p2 = multiprocessing.Process(target=do_something)

# p1.start()
# p2.start()

# p1.join()
# p2.join()

# step 3 - iterative multiprocessing
# procs = []
# for _ in range(10):
#     p = multiprocessing.Process(target=do_something, args=[1.5])
#     p.start()
#     procs.append(p)

# for proc in procs:
#     proc.join()

# step 4 -
import concurrent.futures
with concurrent.futures.ProcessPoolExecutor() as executor:
    secs = [5,4,3,2,1]
    # v1
#     results = [executor.submit(do_something, sec) for _ in secs]
#     for f in concurrent.futures.as_completed(results): # results = list of futures objects
#         print(f.result())
    # v2
    results = executor.map(do_something, secs) # v2
    for result in results:
        print(result)


finish = time.perf_counter()
print(f'finished in {round(finish-start,2)} seconds(s)')

### threading ###
start = time.perf_counter()

# step 1 - basic threading
# t1 = threading.Thread(target=do_something,args=[1.5])
# t2 = threading.Thread(target=do_something,args=[1.5])
# t1.start()
# t2.start()
# t1.join()
# t2.join()

# step 2 - iterative threading
# threads = []
# for _ in range(10):
#     t = threading.Thread(target=do_something,args=[1.5])
#     t.start()
# for thread in threads:
#     thread.join()

# step 3 - concurrent futures
with concurrent.futures.ThreadPoolExecutor() as executor:
    results = [executor.submit(do_something, 1.5) for _ in range(10)]
    # v1
    for f in concurrent.futures.as_completed(results):
        print(f.result())
    # v2
    secs = [1,2,3,4,5]
    results = executor.map(do_something,secs)
    for result in concurrent.futures.as_completed(results):
        print(result)


finish = time.perf_counter()
print(f'finished in {round(finish-start,2)} seconds(s)')

### working example ###
import requests
img_urls = [

]
t1 = time.perf_counter()
for img_url in img_urls:
    img_bytes = requests.get(img_url).content
    img_name = img_url.split('/')[3]
    img_name = f'{img_name}.jpg'
    with open(img_name,'wb') as img_file:
        img_file.write(img_bytes)
        print(f'{img_name} was downloaded...')

t2 = time.perf_counter()
print(f'Finished in {t2-t1} seconds')

t1 = time.perf_counter()
def download(img_url):
    img_bytes = requests.get(img_url).content
    img_name = img_url.split('/')[3]
    img_name = f'{img_name}.jpg'
    with open(img_name,'wb') as img_file:
        img_file.write(img_bytes)
        print(f'{img_name} was downloaded...')

with concurrent.futures.ThreadPoolExecutor() as executor:
    results = executor.map(download,img_urls)
t2 = time.perf_counter()

from tqdm import tqdm
from pytube import YouTube
import requests


def download_video(video):
    response = requests.get(video["download"], stream=True)
    total_size = int(response.headers.get("content-length", 0))

    # Start downloading with progress bar
    with open(f"/home/syedamirali/Downloads/waz/{video['title']}.mp4", "wb") as f, tqdm(
        desc=video["title"],
        total=total_size,
        unit="B",
        unit_scale=True,
        unit_divisor=1024,
        miniters=1,
    ) as pbar:
        for data in response.iter_content(chunk_size=1024):
            f.write(data)
            pbar.update(len(data))


YT_VIDEO_URLS = [
    # "https://www.youtube.com/watch?v=EJqCfQoL3Ls",
    # "https://www.youtube.com/watch?v=PwCk-obyEPw",
    # "https://www.youtube.com/watch?v=PwCk-obyEPw",
    # "https://www.youtube.com/watch?v=wWP3aHdxR68",
    # "https://www.youtube.com/watch?v=SCJ1WvZR1sA",
    # "https://www.youtube.com/watch?v=_CVAzZHZDZk",
    # "https://www.youtube.com/watch?v=QBhOX7YcpPk",
    # "https://www.youtube.com/watch?v=sjzuD3QiWM4",
    # "https://www.youtube.com/watch?v=LUljOpNCWHU",
    # "https://www.youtube.com/watch?v=BDvs_RE5E6Q",
    # "https://www.youtube.com/watch?v=Mtpmff71uXc",
    # "https://www.youtube.com/watch?v=ef8Ci5Zc3ZA",
    # "https://www.youtube.com/watch?v=i9UMw6orgzQ",
    # "https://www.youtube.com/watch?v=9TDCoeDYl6g",
    # "https://www.youtube.com/watch?v=9DDe6Zr34YU",
    # "https://www.youtube.com/watch?v=PJtXHwxWk-0",
    # "https://www.youtube.com/watch?v=IwNlEN4P0Mk",
    # "https://www.youtube.com/watch?v=QXJ60rt6DBo",
    # "https://www.youtube.com/watch?v=4R_KY7mtVEI",
    # "https://www.youtube.com/watch?v=I3j56HoD8nc",
    # "https://www.youtube.com/watch?v=OW-ES-nK3Z4",
    # "https://www.youtube.com/watch?v=prVMHbSHXO0",
    # "https://www.youtube.com/watch?v=sqMpLVWTM4E",
    # "https://www.youtube.com/watch?v=6IGA71Tw2Q8",
    # "https://www.youtube.com/watch?v=qj6u_SdN_jM",
    # "https://www.youtube.com/watch?v=PNjfxkqv_to",
    # "https://www.youtube.com/watch?v=zm2Pa2Gw-lw",
    # "https://www.youtube.com/watch?v=MMhs07S7exg",
    # "https://www.youtube.com/watch?v=nXOK8HZ93MQ",
    # "https://www.youtube.com/watch?v=0eCpPyX16dY",
]


def download_youtube_video(video):
    download_path = "/home/syedamirali/Downloads/waz/new"
    yt = YouTube(video)

    title = yt.title
    stream = yt.streams.filter(res="360p", file_extension="mp4").first()
    response = requests.get(stream.url, stream=True)
    total_size = int(response.headers.get("content-length", 0))

    # Start Downloading

    with open(f"{download_path}/{title}.mp4", "wb") as f, tqdm(
        desc=title,
        total=total_size,
        unit="B",
        unit_scale=True,
        unit_divisor=1024,
        miniters=1,
    ) as pbar:
        for data in response.iter_content(chunk_size=1024):
            f.write(data)
            pbar.update(len(data))


YOUSUF_JULEKHA_VIDEOS_81_TO_104 = [
    {
        "download": "https://video-fra3-1.xx.fbcdn.net/v/t42.1790-2/10000000_3002577126649119_2646854157590404814_n.mp4?_nc_cat=101&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjM5MiwicmxhIjo0MDk2LCJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_ohc=b64ow-dF-TYAX9nNVyr&rl=392&vabr=218&_nc_ht=video-fra3-1.xx&edm=AGo2L-IEAAAA&oh=00_AfAYGJis4EW5vzj-wwuHw6J04eB18GHWpCv6tcguahIBGA&oe=65F9E171&dl=1",
        "title": "Yousuf Julekha part (81-90)",
    },
    {
        "download": "https://video-lga3-2.xx.fbcdn.net/v/t42.1790-2/10000000_338843877703067_8466373540857883487_n.mp4?_nc_cat=106&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjM2NywicmxhIjo0MDk2LCJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_ohc=socB2D2g_5AAX_1JCMc&rl=367&vabr=204&_nc_ht=video-lga3-2.xx&edm=AGo2L-IEAAAA&oh=00_AfArRG_-Rg_ksLJHo64UXjEgky2WGn2ySxL_SmaiKRYlyw&oe=65F9BFCA&dl=1",
        "title": "Yousuf Julekha part (91-100)",
    },
    {
        "download": "https://video-atl3-1.xx.fbcdn.net/v/t42.1790-2/10000000_338351504770726_9092770562607348141_n.mp4?_nc_cat=103&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjM3OSwicmxhIjo0MDk2LCJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_ohc=l0iKZ1D9h6cAX-G4a4Q&rl=379&vabr=211&_nc_ht=video-atl3-1.xx&edm=AGo2L-IEAAAA&oh=00_AfBtBsrRY7ZM4vQFWINV8EEkS8OQeIGiZ7D_tAggYk4ckg&oe=65F930A1&dl=1",
        "title": "Yousuf Julekha part (101-104)",
    },
]


for video in YOUSUF_JULEKHA_VIDEOS_81_TO_104:
    download_video(video)

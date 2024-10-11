const ytUrls = [
  "https://www.youtube.com/watch?v=EJqCfQoL3Ls",
  "https://www.youtube.com/watch?v=PwCk-obyEPw",
  "https://www.youtube.com/watch?v=wWP3aHdxR68",
  "https://www.youtube.com/watch?v=SCJ1WvZR1sA",
  "https://www.youtube.com/watch?v=_CVAzZHZDZk",
  "https://www.youtube.com/watch?v=QBhOX7YcpPk",
  "https://www.youtube.com/watch?v=sjzuD3QiWM4",
  "https://www.youtube.com/watch?v=LUljOpNCWHU",
  "https://www.youtube.com/watch?v=BDvs_RE5E6Q",
  "https://www.youtube.com/watch?v=Mtpmff71uXc",
  "https://www.youtube.com/watch?v=ef8Ci5Zc3ZA",
  "https://www.youtube.com/watch?v=i9UMw6orgzQ",
  "https://www.youtube.com/watch?v=9TDCoeDYl6g",
  "https://www.youtube.com/watch?v=9DDe6Zr34YU",
  "https://www.youtube.com/watch?v=PJtXHwxWk-0",
  "https://www.youtube.com/watch?v=IwNlEN4P0Mk",
  "https://www.youtube.com/watch?v=QXJ60rt6DBo",
  "https://www.youtube.com/watch?v=4R_KY7mtVEI",
  "https://www.youtube.com/watch?v=I3j56HoD8nc",
  "https://www.youtube.com/watch?v=OW-ES-nK3Z4",
  "https://www.youtube.com/watch?v=prVMHbSHXO0",
  "https://www.youtube.com/watch?v=sqMpLVWTM4E",
  "https://www.youtube.com/watch?v=6IGA71Tw2Q8",
  "https://www.youtube.com/watch?v=qj6u_SdN_jM",
  "https://www.youtube.com/watch?v=PNjfxkqv_to",
  "https://www.youtube.com/watch?v=zm2Pa2Gw-lw",
  "https://www.youtube.com/watch?v=MMhs07S7exg",
  "https://www.youtube.com/watch?v=nXOK8HZ93MQ",
  "https://www.youtube.com/watch?v=0eCpPyX16dY",
];

const downloadObj = ytUrls.map((url, index) => ({
  id: index + 1,
  youtube: url,
  title: "",
  download: "",
}));

// console.log("Download Objects =>\n", JSON.stringify(downloadObj), "\n");

const pathgriho_tables = [
  "abouts",
  "about_external_links",
  "about_u_s_bottoms",
  "about_u_s_tops",
  "app_settings",
  "blogs",
  "board_m_embers",
  "book_stores",
  "careers",
  "career_items",
  "career_page_bottoms",
  "career_toops",
  "career_vacant_postions",
  "client_messages",
  "client_navigation_menus",
  "contact_us",
  "contact_us_mains",
  "contac_us",
  "image_galleries",
  "jobs",
  "j_m_c_lists",
  "mission_visions",
  "m_c_lists",
  "news_and_articles",
  "portfolios",
  "settings",
  "sliders",
  "stickers",
  "s_b_page_banners",
  "s_b_page_stickers",
  "s_b_page_x_banners",
  "team_tops",
  "terms_and_conditions",
  "testimonials",
  "video_galleries",
];

const addUserForeignKey = pathgriho_tables.map(
  (tableName) => `
-- Add the created_by column to the ${tableName} table
ALTER TABLE ${tableName}
ADD created_by BIGINT UNSIGNED NOT NULL DEFAULT 1;

-- Add a foreign key constraint to the created_by column
ALTER TABLE ${tableName}
ADD CONSTRAINT ${tableName}_created_by_foreign
FOREIGN KEY (created_by)
REFERENCES users(id)
ON DELETE CASCADE;
`
);
// console.log(
//   "Foreign Key Adding Array On Pathgriho Database =>\n",
//   addUserForeignKey.join("\n"),
//   "\n"
// );

(async function () {
  try {
    const form = new FormData();
    form.append(
      "sf_url",
      "https://www.facebook.com/watch/?v=737792713228439&ref=sharing"
    );
    const res = await fetch("https://worker.savefrom.net/savefrom.php", {
      method: "POST",
      body: form,
    });

    console.log(await res.text());
  } catch (error) {
    console.log("An Error =>", error);
  }
});

const classes = [
  {
    id: "class__1",
    name: "w-full min-h-screen p-6 flex items-center justify-center bg-gradient-to-tr from-cyan-500/10 via-white to-purple-500/10 bg-white",
  },
  {
    id: "class__2",
    name: "max-w-xl bg-slate-300/10 border border-solid border-slate-300 shadow-[0px_2px_4px_0px_rgba_(0,0,0,0.12)] rounded-3xl p-10",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
  {
    id: "class__",
    name: "",
  },
];

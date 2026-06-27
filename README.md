# refrain-wbh.github.io

Binghai Wang (汪冰海) 的个人学术主页，基于 [al-folio](https://github.com/alshedivat/al-folio) (Jekyll) 构建。

## 本地预览

环境（已在本机配置好）：Homebrew Ruby 4.x + bundler，依赖装在 `vendor/bundle`。

```bash
./serve.sh
# 然后浏览器打开 http://127.0.0.1:8080/ （改完文件刷新页面即可）
```

> 说明：本机 Ruby 4.0 自带的 WEBrick 服务器有问题（返回空响应），所以 `serve.sh`
> 用 Jekyll 构建 + 监听变化，再用 Python 的 http.server 托管 `_site`，更稳定。

如果换了机器，第一次需要先安装依赖：

```bash
brew install ruby imagemagick
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
gem install bundler
bundle config set --local path 'vendor/bundle'
bundle install
```

## 在哪里改内容

| 想改的东西 | 文件 |
| --- | --- |
| 首页简介 / 头像 / 副标题 | `_pages/about.md`（头像换成 `assets/img/prof_pic.jpg`） |
| 站点标题、姓名、URL、关键词 | `_config.yml` |
| 社交链接（邮箱 / GitHub / Scholar 等） | `_data/socials.yml` |
| 论文列表 | `_bibliography/papers.bib`（`selected={true}` 会出现在首页） |
| News 动态 | `_news/` 下每条一个 `.md` |
| CV | `_data/cv.yml` |
| 博客文章 | `_posts/` 下 `YYYY-MM-DD-标题.md` |

> 文中所有 `TODO:` 注释都是待你补充真实信息的地方（邮箱、导师、入学年份、论文等）。

## 部署

`git push` 到 `main` 后，`.github/workflows/deploy.yml` 会自动构建并把成品推到 `gh-pages` 分支。

首次需在 GitHub 仓库 **Settings → Pages** 里把 **Source** 设为 **Deploy from a branch → `gh-pages` / root**。
之后访问地址为 https://refrain-wbh.github.io 。

旧的 2022 Hexo 博客原始文件保存在 `old-hexo-blog` 分支，可随时找回。

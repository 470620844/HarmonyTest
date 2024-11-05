

export class ArticleResponseBody {
  private curPage: number

  public setcurPage(value: number) {
    this.curPage = value
  }

  public getcurPage(): number {
    return this.curPage
  }

  private datas: Array<Article>

  public setsetDatas(value: Array<Article>) {
    this.datas = value
  }

  public getDatas(): Array<Article> {
    return this.datas
  }

  private offset: number

  public setOffset(value: number) {
    this.offset= value
  }

  public getOffset(): number {
    return this.offset
  }

  private over: Boolean

  public setOver(value: Boolean) {
    this.over = value
  }

  public getOver(): Boolean {
    return this.over
  }

  private pageCount: number

  public setPageCount(value: number) {
    this.pageCount = value
  }

  public getPageCount(): number {
    return this.pageCount
  }

  private size: number

  public setSize(value: number) {
    this.size = value
  }

  public getSize(): number {
    return this.size
  }

  private total: number

  public setTotal(value: number) {
    this.total = value
  }

  public getTotal(): number {
    return this.total
  }

  constructor(curPage: number, datas: Array<Article>, offset: number, over: Boolean, pageCount: number, size: number,
    total: number) {
    this.curPage = curPage
    this.datas = datas
    this.offset= offset
    this.over = over
    this.pageCount = pageCount
    this.size = size
    this.total = total
  }

}
export class Covert{
  public static toArticleResponseBody(json:string):ArticleResponseBody{
    return JSON.parse(json)
  }
  public static toArticleResponseBodyJson(json:ArticleResponseBody):string{
    return JSON.stringify(json)
  }
}
export class Article {
  private apkLink: string

  public setApkLink(value: string) {
    this.apkLink = value
  }

  public getApkLink(): string {
    return this.apkLink
  }

  private audit: number

  public setAudit(value: number) {
    this.audit = value
  }

  public getaudit(): number {
    return this.audit
  }

  private author: string

  public setauthor(value: string) {
    this.author = value
  }

  public getauthor(): string {
    return this.author
  }

  private chapterId: number

  public setchapterId(value: number) {
    this.chapterId = value
  }

  public getchapterId(): number {
    return this.chapterId
  }

  private chapterName: string

  public setchapterName(value: string) {
    this.chapterName = value
  }

  public getchapterName(): string {
    return this.chapterName
  }

  private collect: Boolean

  public setcollect(value: Boolean) {
    this.collect = value
  }

  public getcollect(): Boolean {
    return this.collect
  }

  private courseId: number

  public setcourseId(value: number) {
    this.courseId = value
  }

  public getcourseId(): number {
    return this.courseId
  }

  private desc: string

  public setdesc(value: string) {
    this.desc = value
  }

  public getdesc(): string {
    return this.desc
  }

  private envelopePic: string

  public setenvelopePic(value: string) {
    this.envelopePic = value
  }

  public getenvelopePic(): string {
    return this.envelopePic
  }

  private fresh: Boolean

  public setfresh(value: Boolean) {
    this.fresh = value
  }

  public getfresh(): Boolean {
    return this.fresh
  }

  private id: number

  public setid(value: number) {
    this.id = value
  }

  public getid(): number {
    return this.id
  }

  private link: string

  public setlink(value: string) {
    this.link = value
  }

  public getlink(): string {
    return this.link
  }

  private niceDate: string

  public setniceDate(value: string) {
    this.niceDate = value
  }

  public getniceDate(): string {
    return this.niceDate
  }

  private niceShareDate: string

  public setniceShareDate(value: string) {
    this.niceShareDate = value
  }

  public getniceShareDate(): string {
    return this.niceShareDate
  }

  private origin: string

  public setorigin(value: string) {
    this.origin = value
  }

  public getorigin(): string {
    return this.origin
  }

  private prefix: string

  public setprefix(value: string) {
    this.prefix = value
  }

  public getprefix(): string {
    return this.prefix
  }

  private projectLink: string

  public setprojectLink(value: string) {
    this.projectLink = value
  }

  public getprojectLink(): string {
    return this.projectLink
  }

  private publishTime: number

  public setpublishTime(value: number) {
    this.publishTime = value
  }

  public getpublishTime(): number {
    return this.publishTime
  }

  private shareDate: string

  public setshareDate(value: string) {
    this.shareDate = value
  }

  public getshareDate(): string {
    return this.shareDate
  }

  private shareUser: string

  public setshareUser(value: string) {
    this.shareUser = value
  }

  public getshareUser(): string {
    return this.shareUser
  }

  private superChapterId: number

  public setsuperChapterId(value: number) {
    this.superChapterId = value
  }

  public getsuperChapterId(): number {
    return this.superChapterId
  }

  private superChapterName: string

  public setsuperChapterName(value: string) {
    this.superChapterName = value
  }

  public getsuperChapterName(): string {
    return this.superChapterName
  }

  private tags: Array<Tag>

  public settags(value: Array<Tag>) {
    this.tags = value
  }

  public gettags(): Array<Tag> {
    return this.tags
  }

  private title: string

  public settitle(value: string) {
    this.title = value
  }

  public gettitle(): string {
    return this.title
  }

  private type: number

  public settype(value: number) {
    this.type = value
  }

  public gettype(): number {
    return this.type
  }

  private userId: number

  public setuserId(value: number) {
    this.userId = value
  }

  public getuserId(): number {
    return this.userId
  }

  private visible: number

  public setvisible(value: number) {
    this.visible = value
  }

  public getvisible(): number {
    return this.visible
  }

  private zan: number

  public setzan(value: number) {
    this.zan = value
  }

  public getzan(): number {
    return this.zan
  }

  private top: string

  public settop(value: string) {
    this.top = value
  }

  public gettop(): string {
    return this.top
  }

  constructor(apkLink: string, audit: number, author: string, chapterId: number, chapterName: string, collect: Boolean,
    courseId: number, desc: string, envelopePic: string, fresh: Boolean, id: number, link: string, niceDate: string,
    niceShareDate: string, origin: string, prefix: string, projectLink: string, publishTime: number, shareDate: string,
    shareUser: string, superChapterId: number, superChapterName: string, tags: Array<Tag>, title: string, type: number,
    userId: number, visible: number, zan: number, top: string) {
    this.apkLink = apkLink
    this.audit = audit
    this.author = author
    this.chapterId = chapterId
    this.chapterName = chapterName
    this.collect = collect
    this.courseId = courseId
    this.desc = desc
    this.envelopePic = envelopePic
    this.fresh = fresh
    this.id = id
    this.link = link
    this.niceDate = niceDate
    this.niceShareDate = niceShareDate
    this.origin = origin
    this.prefix = prefix
    this.projectLink = projectLink
    this.publishTime = publishTime
    this.shareDate = shareDate
    this.shareUser = shareUser
    this.superChapterId = superChapterId
    this.superChapterName = superChapterName
    this.tags = tags
    this.title = title
    this.type = type
    this.userId = userId
    this.visible = visible
    this.zan = zan
    this.top = top
  }

}

export class Tag {
  private name: string

  public setname(value: string) {
    this.name = value
  }

  public getname(): string {
    return this.name
  }

  private url: string

  public seturl(value: string) {
    this.url = value
  }

  public geturl(): string {
    return this.url
  }

  constructor(name: string, url: string) {
    this.name = name
    this.url = url
  }

}
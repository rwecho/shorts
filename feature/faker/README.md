# Faker Library for ArkTS

一个类似于 faker-js 的 ArkTS 数据模拟库，为 HarmonyOS 应用开发提供各种假数据生成功能。

## 功能特性

- 🎯 **ArkTS 兼容** - 完全符合 ArkTS 规范
- 🌐 **中英文支持** - 支持中文和英文数据生成
- 📱 **移动优化** - 针对移动应用场景优化
- 🎲 **可重现性** - 支持种子设置，生成可重现的数据
- 🔧 **模块化设计** - 按功能分类，易于使用和维护
- 🖼️ **Unsplash 集成** - 完整的 Unsplash 图片生成支持，包含多种获取方式

## 安装和导入

### 安装

使用 ohpm 安装：

```bash
ohpm install faker
```

或者使用简短命令：

```bash
ohpm i faker
```

### 导入

```typescript
// 导入主要的 Faker 类
import Faker from "@ohos/faker";

// 或者导入特定的生成器
import { Name, Address, Phone, Internet, Lorem } from "@ohos/faker";

// 导入类型定义（用于 TypeScript 类型检查）
import { UnsplashImageData } from "@ohos/faker";
```

## 基础用法

### 设置随机种子

```typescript
// 设置种子以获得可重现的结果
Faker.seed(12345);
```

### 姓名生成

```typescript
// 中文姓名
const chineseName = Faker.names.chineseName(); // "张伟"

// 英文姓名
const firstName = Faker.names.firstName(); // "James"
const lastName = Faker.names.lastName(); // "Smith"
const fullName = Faker.names.fullName(); // "James Smith"
const title = Faker.names.title(); // "Dr."
```

### 地址生成

```typescript
// 城市
const city = Faker.address.city(); // "北京市"

// 区县
const district = Faker.address.district(); // "朝阳区"

// 街道地址
const streetAddress = Faker.address.streetAddress(); // "中山路123号"

// 完整地址
const fullAddress = Faker.address.fullAddress(); // "北京市朝阳区中山路123号"

// 邮政编码
const zipCode = Faker.address.zipCode(); // "100001"
```

### 电话号码生成

```typescript
// 手机号码
const mobile = Faker.phone.mobile(); // "13812345678"

// 座机号码
const landline = Faker.phone.landline(); // "0010-12345678"
```

### 网络相关数据

```typescript
// 电子邮件
const email = Faker.internet.email(); // "james123@gmail.com"

// 用户名
const username = Faker.internet.userName(); // "james456"

// URL
const url = Faker.internet.url(); // "https://www.james.com"

// IP 地址
const ip = Faker.internet.ip(); // "192.168.1.1"

// MAC 地址
const mac = Faker.internet.mac(); // "ab:cd:ef:12:34:56"
```

### 文本生成

```typescript
// 单词
const word = Faker.lorem.word(); // "lorem"

// 多个单词
const words = Faker.lorem.multipleWords(5); // "lorem ipsum dolor sit amet"

// 句子
const sentence = Faker.lorem.sentence(); // "Lorem ipsum dolor sit amet."

// 段落
const paragraph = Faker.lorem.paragraph(); // "Lorem ipsum dolor..."

// 多个段落
const paragraphs = Faker.lorem.paragraphs(3); // "Lorem...\n\nIpsum..."
```

### 日期时间生成

```typescript
// 过去的日期
const pastDate = Faker.dateTime.past(2); // 过去2年内的随机日期

// 未来的日期
const futureDate = Faker.dateTime.future(1); // 未来1年内的随机日期

// 两个日期之间
const betweenDate = Faker.dateTime.between(
  new Date("2020-01-01"),
  new Date("2025-12-31")
);

// 时间戳
const timestamp = Faker.dateTime.timestamp(); // 1640995200000
```

### 数字生成

```typescript
// 整数
const integer = Faker.numbers.int(1, 100); // 42

// 浮点数
const float = Faker.numbers.float(0, 100, 2); // 42.56

// 百分比
const percentage = Faker.numbers.percentage(); // "85%"

// 货币
const currency = Faker.numbers.currency(100, 10000); // "¥1,234.56"
```

### 颜色生成

```typescript
// 十六进制颜色
const hex = Faker.color.hex(); // "#ff5733"

// RGB 颜色
const rgb = Faker.color.rgb(); // "rgb(255, 87, 51)"

// RGBA 颜色
const rgba = Faker.color.rgba(); // "rgba(255, 87, 51, 0.8)"
```

### 字符串生成

```typescript
// 仅字母
const letters = Faker.string.alpha({ length: 12, casing: "lower" });

// 字母数字
const alphaNum = Faker.string.alphanumeric({ length: 16 });

// 数字字符串
const numeric = Faker.string.numeric(8); // 8位数字，允许前导0
const numericNoZero = Faker.string.numeric(8, { allowLeadingZeros: false }); // 首位不为0

// 二进制/八进制/十六进制
const bin = Faker.string.binary(16); // 16位二进制
const oct = Faker.string.octal(12); // 12位八进制
const hexS = Faker.string.hexadecimal({
  length: 8,
  prefix: true,
  casing: "lower",
}); // 带0x前缀

// 从自定义字符集生成
const fromChars = Faker.string.fromCharacters("ABCDEF", 6); // 只使用这些字符
const fromArray = Faker.string.fromCharacters(["OK", "NG", "ID"], 3); // 从字符串数组中选取

// 随机样本字符串
const sample = Faker.string.sample(10); // 默认字母数字
const sampleCustom = Faker.string.sample(10, "ABC123!"); // 指定字符集

// 符号
const sym = Faker.string.symbol();

// ID/标识符
const v4 = Faker.string.uuid(); // UUID v4
const ulid = Faker.string.ulid(); // ULID
const nid = Faker.string.nanoid(); // NanoID (默认21位)
```

### 图片 URL 生成

```typescript
// 基础图片生成
const imageUrl = Faker.image.url(640, 480); // "https://picsum.photos/640/480?random=123"
const avatar = Faker.image.avatar(); // "https://i.pravatar.cc/150?img=123"

// Unsplash 图片生成
const unsplashImage = Faker.image.unsplash(640, 480); // 随机 Unsplash 图片
const natureImage = Faker.image.unsplash(640, 480, "nature"); // 自然主题图片
const keywordImage = Faker.image.unsplashKeyword(640, 480, "sunset"); // 关键词图片
const multiKeywordImage = Faker.image.unsplashMultipleKeywords(640, 480, [
  "ocean",
  "sunset",
]); // 多关键词图片

// Unsplash 特殊功能
const featuredImage = Faker.image.unsplashFeatured(640, 480); // 精选图片
const dailyImage = Faker.image.unsplashDaily(640, 480); // 每日图片
const collectionImage = Faker.image.unsplashCollection(640, 480, "1065976"); // 收藏集图片
const userImage = Faker.image.unsplashUser(640, 480, "nasa"); // 特定用户图片

// 按方向生成图片
const landscapeImage = Faker.image.unsplashOrientation(800, 600, "landscape"); // 横向
const portraitImage = Faker.image.unsplashOrientation(600, 800, "portrait"); // 纵向
const squareImage = Faker.image.unsplashOrientation(600, 600, "squarish"); // 方形

// 获取完整图片数据（类型安全）
import { UnsplashImageData } from "@ohos/faker";

const imageData: UnsplashImageData = Faker.image.unsplashImageData(640, 480);
/*
类型定义：
interface UnsplashImageData {
  id: string;
  url: string;
  thumbnailUrl: string;
  width: number;
  height: number;
  category: string;
  keywords: string[];
  orientation: 'landscape' | 'portrait' | 'squarish';
  alt: string;
  downloadUrl: string;
  authorName: string;
  authorUrl: string;
  description: string;
}

返回示例：
{
  id: "unsplash_123456",
  url: "https://source.unsplash.com/640x480/?nature",
  thumbnailUrl: "https://source.unsplash.com/160x120/?nature",
  width: 640,
  height: 480,
  category: "nature",
  keywords: ["landscape", "mountain", "forest"],
  orientation: "landscape",
  alt: "nature image with landscape, mountain, forest",
  downloadUrl: "https://unsplash.com/photos/download?id=123456",
  authorName: "John Doe",
  authorUrl: "https://unsplash.com/@user123",
  description: "Beautiful nature photograph featuring landscape and mountain"
}
*/

// 获取可用的分类和关键词
const categories = Faker.image.getUnsplashCategories();
const keywords = Faker.image.getUnsplashKeywords();
```

### 商务数据生成

```typescript
// 产品名称
const productName = Faker.commerce.productName(); // "苹果"

// 部门
const department = Faker.commerce.department(); // "电子产品"

// 价格
const price = Faker.commerce.price(10, 1000); // "¥123.45"
```

### 公司数据生成

```typescript
// 公司名称
const companyName = Faker.company.companyName(); // "阿里巴巴"

// 公司后缀
const suffix = Faker.company.suffix(); // "有限公司"

// 完整公司名称
const fullCompanyName = Faker.company.fullName(); // "阿里巴巴有限公司"
```

## 高级用法

### 使用演示类生成复杂数据

```typescript
import { FakerDemo } from "@ohos/faker";

// 生成模拟用户
const user = FakerDemo.generateUser();
console.log(user);
/*
{
  id: 12345,
  chineseName: "张伟",
  englishName: "James Smith",
  email: "james123@gmail.com",
  phone: "13812345678",
  address: "北京市朝阳区中山路123号",
  avatar: "https://i.pravatar.cc/150?img=123",
  company: "阿里巴巴有限公司",
  joinDate: Date,
  salary: "¥15,000.00",
  isActive: true
}
*/

// 生成多个用户
const users = FakerDemo.generateUsers(10);

// 生成模拟产品
const product = FakerDemo.generateProduct();

// 生成多个产品
const products = FakerDemo.generateProducts(20);

// 生成博客文章
const blogPost = FakerDemo.generateBlogPost();

// 生成电商订单
const order = FakerDemo.generateOrder();

// 生成社交媒体帖子
const socialPost = FakerDemo.generateSocialPost();

// 演示所有功能
const allFeatures = FakerDemo.demonstrateAllFeatures();
```

### 自定义数据生成

```typescript
// 创建自定义数据生成器
class CustomDataGenerator {
  static generateEmployee() {
    return {
      employeeId: `EMP-${Faker.numbers.int(1000, 9999)}`,
      name: Faker.names.chineseName(),
      position: Faker.random.arrayElement([
        "工程师",
        "设计师",
        "产品经理",
        "测试工程师",
      ]),
      department: Faker.random.arrayElement([
        "技术部",
        "设计部",
        "产品部",
        "质量部",
      ]),
      email: Faker.internet.email(),
      phone: Faker.phone.mobile(),
      hireDate: Faker.dateTime.past(5),
      salary: Faker.numbers.int(8000, 50000),
      isActive: Faker.random.boolean(),
    };
  }

  static generateProject() {
    return {
      projectId: `PROJ-${Faker.numbers.int(100, 999)}`,
      name: Faker.lorem.multipleWords(Faker.numbers.int(2, 4)),
      description: Faker.lorem.paragraph(),
      startDate: Faker.dateTime.past(1),
      endDate: Faker.dateTime.future(1),
      budget: Faker.numbers.currency(10000, 1000000),
      status: Faker.random.arrayElement([
        "计划中",
        "进行中",
        "已完成",
        "已取消",
      ]),
      priority: Faker.random.arrayElement(["低", "中", "高", "紧急"]),
    };
  }

  // Unsplash 图片画廊生成器
  static generateImageGallery() {
    return {
      galleryId: `gallery_${Faker.numbers.int(1000, 9999)}`,
      title: Faker.lorem.multipleWords(Faker.numbers.int(2, 4)),
      description: Faker.lorem.paragraph(),
      images: Array.from({ length: Faker.numbers.int(10, 30) }, () => ({
        id: `img_${Faker.numbers.int(10000, 99999)}`,
        url: Faker.image.unsplash(800, 600),
        thumbnail: Faker.image.unsplash(200, 150),
        title: Faker.lorem.multipleWords(Faker.numbers.int(2, 5)),
        category: Faker.random.arrayElement(
          Faker.image.getUnsplashCategories()
        ),
        tags: Faker.random
          .shuffle(Faker.image.getUnsplashKeywords())
          .slice(0, 5),
        photographer: Faker.names.fullName(),
        likes: Faker.numbers.int(0, 1000),
        downloads: Faker.numbers.int(0, 500),
      })),
    };
  }

  // 摄影作品集生成器
  static generatePhotographyPortfolio() {
    const categories = Faker.random
      .shuffle(Faker.image.getUnsplashCategories())
      .slice(0, 3);

    return {
      photographerId: `photographer_${Faker.numbers.int(1000, 9999)}`,
      name: Faker.names.fullName(),
      bio: Faker.lorem.paragraph(),
      specialties: categories,
      featuredWork: categories.map((category) => ({
        category: category,
        coverImage: Faker.image.unsplash(800, 600, category),
        images: Array.from({ length: Faker.numbers.int(6, 12) }, () => ({
          url: Faker.image.unsplash(640, 480, category),
          title: Faker.lorem.multipleWords(Faker.numbers.int(2, 4)),
          description: Faker.lorem.sentence(),
          orientation: Faker.random.arrayElement([
            "landscape",
            "portrait",
            "squarish",
          ]),
        })),
      })),
    };
  }
}
```

### Unsplash 高级用法示例

```typescript
// 生成不同主题的图片集合
const themes = ["nature", "technology", "food", "travel", "architecture"];
const themedImages = themes.map((theme) => ({
  theme: theme,
  coverImage: Faker.image.unsplash(800, 400, theme),
  gallery: Array.from({ length: 8 }, () =>
    Faker.image.unsplash(400, 300, theme)
  ),
}));

// 生成响应式图片集
const responsiveImageSet = {
  desktop: Faker.image.unsplashOrientation(1920, 1080, "landscape"),
  tablet: Faker.image.unsplashOrientation(768, 1024, "portrait"),
  mobile: Faker.image.unsplashOrientation(375, 667, "portrait"),
  thumbnail: Faker.image.unsplash(150, 150),
};

// 生成带完整元数据的图片
const imageWithMetadata = Faker.image.unsplashImageData(800, 600);
console.log("图片信息:", imageWithMetadata);

// 使用收藏集生成主题一致的图片
const collectionImages = Array.from({ length: 10 }, () =>
  Faker.image.unsplashCollection(640, 480, "1065976")
);

// 生成特定用户的图片集
const nasaImages = Array.from({ length: 5 }, () =>
  Faker.image.unsplashUser(800, 600, "nasa")
);
```

## API 参考

### 主要类

- `Faker` - 主要的 Faker 类，提供所有生成器的访问
- `Name` - 姓名生成器
- `Address` - 地址生成器
- `Phone` - 电话号码生成器
- `Internet` - 网络相关数据生成器
- `Lorem` - Lorem ipsum 文本生成器
- `DateTime` - 日期时间生成器
- `Numbers` - 数字生成器
- `Color` - 颜色生成器
- `Image` - 图片 URL 生成器
- `Commerce` - 商务数据生成器
- `Company` - 公司数据生成器

### 实用工具

- `Random` - 随机数生成实用工具
- `FakerDemo` - 演示类，提供复杂数据生成示例

## 测试

库包含完整的单元测试，确保所有功能正常工作：

```bash
# 运行测试
hvigorw test
```

## 贡献

欢迎贡献代码！请确保：

1. 遵循 ArkTS 编码规范
2. 添加适当的类型注解
3. 为新功能编写测试
4. 更新文档

## 许可证

MIT License

## 更新日志

### v1.0.0

- 初始版本发布
- 支持基本的数据生成功能
- 中英文数据支持
- 完整的单元测试覆盖

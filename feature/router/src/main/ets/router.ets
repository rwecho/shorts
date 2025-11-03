import { logger } from "utils";

class AppRouter {
  stack: NavPathStack = new NavPathStack();

  constructor() {
    logger.info('nav path stack entry....')
  }

  push(name: string, parameters?: object) {
    this.stack.pushPath({
      name: name,
      param: parameters
    })
  }
}

const router = new AppRouter()

export { router }
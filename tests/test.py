import time
from random import random
from typing import List, Dict, Optional

class Alright:
    """ Docstring here """

    def __init__(self, param: str):
        self._param = param

    @property
    def param(self) -> str:
        return self._param

    @staticmethod
    def callme(values: List[int]) -> Optional[int]:
        for v in values:
            print(v if v > 0 else 0)
            if v > 22:
                return 22
        return None


def here_a_dict() -> Dict:
    return {
        'param': 22,
        'value': 42,
        'float': 62,
    }


def main():
    value = random()
    print(f'Here we are, stuck by this river... {value}')
    alright = Alright(str(value))
    print(f'Alright... {alright.param}')

    try:
        here_it_is = here_a_dict()
        res = Alright.callme([v for v in here_it_is.values()])
        if res is not None:
            raise ValueError("Ooopsy")
    except Exception as e:
        print(e)


if __name__ == '__main__':
    main()

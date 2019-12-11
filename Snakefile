import itertools

configfile: 'config.yaml'

include: 'rules/processing.smk'


def all_pairs(wildcards):
    '''
    '''
    samples = [s for s in config['reads']]
    input_list = [f'output/{sample1}_{sample2}.pileup' for
                  sample1, sample2 in itertools.combinations(samples, 2)]
    return input_list


rule all:
    input:
        all_pairs
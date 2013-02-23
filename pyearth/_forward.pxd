
cimport numpy as cnp
import numpy as np
ctypedef cnp.float64_t FLOAT_t
ctypedef cnp.int_t INT_t
ctypedef cnp.uint8_t BOOL_t
from _basis cimport Basis
from _record cimport ForwardPassRecord

ctypedef enum StoppingCondition:
    MAXTERMS=0,
    MAXRSQ=1,
    NOIMPRV=2,
    LOWGRSQ=3,
    NUMDIFF=4,
    NUMERR=5
    

cdef class ForwardPasser:
    cdef int endspan
    cdef int minspan
    cdef FLOAT_t endspan_alpha
    cdef FLOAT_t minspan_alpha
    cdef int max_terms
    cdef int max_degree
    cdef FLOAT_t thresh
    cdef FLOAT_t penalty
    cdef int check_every
    cdef int min_search_points
    cdef ForwardPassRecord record
    cdef cnp.ndarray X
    cdef cnp.ndarray y
    cdef unsigned int m
    cdef unsigned int n
    cdef Basis basis
    cdef cnp.ndarray B
    cdef list xlabels
    cdef cnp.ndarray sort_tracker
    cdef cnp.ndarray sorting
    cdef cnp.ndarray mwork
    cdef cnp.ndarray delta
    cdef cnp.ndarray R
    cdef cnp.ndarray u
    cdef cnp.ndarray v
    cdef cnp.ndarray B_cum
    
    cpdef Basis get_basis(ForwardPasser self)
    
    cpdef run(ForwardPasser self)
    
    cdef stop_check(ForwardPasser self)
    
    cdef next_pair(ForwardPasser self)
    
    cdef best_knot(ForwardPasser self, unsigned int parent, unsigned int variable, cnp.ndarray[INT_t,ndim=1] candidates, FLOAT_t * mse, FLOAT_t * knot, unsigned int * knot_idx)

    
    
    